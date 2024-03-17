const typeDefs = `
  type DogBreed {
    id: String!
    short_description: String
    long_description: String
    image_path: String
  }

  type Query {
    hello: String
    getDogBreeds: [DogBreed]
    getDogBreed(id: String!): DogBreed
  }

  type Mutation {
    createDogBreed(
      id: String!
      short_description: String
      long_description: String
      image_path: String
    ): DogBreed
  }
`;

export default typeDefs;
