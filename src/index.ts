import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';
dotenv.config();

import morgan from 'morgan';
import cors from 'cors';
import bodyParser from 'body-parser';
import dogBreedProvider, { NewDogBreed } from './DB/dogBreedProvider';

const app: Express = express();
const port = process.env.PORT || 3000;

app.use(morgan('combined'));
app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/', (req: Request, res: Response) => {
  res.send('Hello, World!');
});

app.get('/dog-breed', async (req: Request, res: Response) => {
  const data = await dogBreedProvider.getDogBreeds();
  res.status(200).send(data);
});

app.post('/dog-breed', async (req: Request, res: Response) => {
  const newDogBreed = req.body as NewDogBreed;
  const createdDogBreed = await dogBreedProvider.createDogBreed(newDogBreed);
  res.status(201).send(createdDogBreed);
});

app.get('*', (req: Request, res: Response) => {
  res.status(404).send('Endpoint does not EXISTS');
});

app.listen(port, () => {
  console.log(`⚡️[server]: Server is running at https://localhost:${port}`);
});
