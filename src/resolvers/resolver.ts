import { GraphQLError } from 'graphql';
import { PubSub } from 'graphql-subscriptions';
import * as db from '../DB/postgres';

// import jwt from 'jsonwebtoken';
// import bcrypt from 'bcrypt';
interface DogBreed {
  id: string;
  short_description: string;
  long_description: string;
  image_path: string;
}
interface NewDogBreed {
  id: string;
  short_description: string;
  long_description: string;
  image_path: string;
}

const resolvers = {
  Query: {
    hello: () => {
      return 'Hello, world!';
    },
    getDogBreeds: async (): Promise<DogBreed[]> => {
      const { rows } = await db.query('SELECT * FROM dog_breed', []);
      return rows;
    },
    getDogBreed: async (_: any, args: { id: string }): Promise<DogBreed[]> => {
      const { id } = args;
      const { rows } = await db.query('SELECT * FROM dog_breed WHERE id = $1', [
        id,
      ]);
      return rows[0];
    },
  },
  Mutation: {
    createDogBreed: async (
      _: any,
      args: {
        id: string;
        short_description: string;
        long_description: string;
        image_path: string;
      }
    ): Promise<NewDogBreed> => {
      const { id, short_description, long_description, image_path } = args;
      const { rows } = await db.query(
        'INSERT INTO dog_breed (id, short_description, long_description, image_path) VALUES ($1, $2, $3, $4) RETURNING *',
        [id, short_description, long_description, image_path]
      );
      return rows[0];
    },
  },
};

export default resolvers;
