import { GraphQLError } from 'graphql';
import { PubSub } from 'graphql-subscriptions';
import * as db from '../DB/postgres';

// import jwt from 'jsonwebtoken';
// import bcrypt from 'bcrypt';

const resolvers = {
  Query: {
    hello: () => {
      return 'Hello, world!';
    },
    getDogBreeds: async () => {
      const { rows } = await db.query('SELECT * FROM dog_breed', []);
      return rows;
    },
  },
};

export default resolvers;
