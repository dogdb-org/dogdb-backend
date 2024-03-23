import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';
dotenv.config();

import morgan from 'morgan';
import cors from 'cors';
import bodyParser from 'body-parser';
import dogBreedProvider, { NewDogBreed } from './DB/dogBreedProvider';

const app: Express = express();
const port = process.env.PORT || 5000;

app.use(morgan('combined'));
app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/', (req: Request, res: Response) => {
  res.send('Hello, World!');
});

app.get('/dog-breed', async (req: Request, res: Response) => {
  try {
    const data = await dogBreedProvider.getDogBreeds();
    res.status(200).send(data);
  } catch (error: any) {
    res.status(500).send("Error occurred! " + error.message)
  }
  
});

app.post('/dog-breed', async (req: Request, res: Response) => {
  const newDogBreed = req.body as NewDogBreed;
  try {
    const createdDogBreed = await dogBreedProvider.createDogBreed(newDogBreed);
    res.status(201).send(createdDogBreed);
  } catch (error: any) {
    res.status(400).send(error)
  }
});

app.get('*', (req: Request, res: Response) => {
  res.status(404).send('Endpoint does not EXISTS');
});

app.listen(port, () => {
  console.log(`⚡️[server]: Server is running at https://localhost:${port}`);
});
