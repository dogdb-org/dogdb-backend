import express, { Express, Request, Response } from 'express';
import { getData as getDogBreeds } from './DB/postgres'
import dotenv from 'dotenv';
dotenv.config();

import morgan from 'morgan';
import cors from 'cors';
import bodyParser from 'body-parser';

const app: Express = express();
const port = process.env.PORT || 3000;

app.use(morgan('combined'));
app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/', (req: Request, res: Response) => {
  res.send("Hello, World!");
});

app.get('/dog-breed', async (req: Request, res: Response) => {
  const data = await getDogBreeds();
  res.send(data);
});

app.get('*', (req: Request, res: Response) => {
  res.send('Endpoint does not EXISTS');
});

app.listen(port, () => {
  console.log(`⚡️[server]: Server is running at https://localhost:${port}`);
});
