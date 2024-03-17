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
  }
`;

export default typeDefs;
