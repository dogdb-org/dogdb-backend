import Koa from 'koa';
import Router from 'koa-router';
import dotenv from 'dotenv';
dotenv.config();

import { ApolloServer } from 'apollo-server-koa';
import cors from '@koa/cors';
import bodyParser from 'koa-bodyparser';
// import jwt from 'jsonwebtoken';

import typeDefs from './schemas/schema';
import resolvers from './resolvers/resolver';

const app: Koa = new Koa();
const router = new Router();
const port = process.env.PORT || 3000;

// app.use(cors({ credentials: true }));
app.use(cors());

const server = new ApolloServer({
  typeDefs,
  resolvers,
  context: async ({ ctx }) => {
    //const auth = ctx.headers.authorization;
    // let currentUser = null;
    // if (auth && auth.startsWith('Bearer ')) {
    //   const token = auth.substring(7);
    //   try {
    //     const decodedToken = jwt.verify(token, process.env.SECRET);
    //     currentUser = await User.findById(decodedToken.id);
    //   } catch (error) {
    //     console.error('There was an error with authentication', error);
    //   }
    // }
    // return { currentUser, ctx };
    return {
      ctx,
    };
  },
});

async function startServer() {
  await server.start();

  server.applyMiddleware({ app });

  router.get('/api/v1', async (ctx) => {
    ctx.body = 'Hello World';
  });
  app.use(router.routes()).use(router.allowedMethods());

  const PORT = process.env.PORT || 8050;
  app.listen(PORT, () =>
    console.log(
      `🚀 Server ready at http://localhost:${PORT}${server.graphqlPath}`
    )
  );
}

startServer().catch((err) => console.error('Server failed to start', err));
