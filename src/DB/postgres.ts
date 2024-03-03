import dotenv from 'dotenv';
dotenv.config();
import { Client, Pool } from 'pg'


const pool = new Pool({
  host: process.env.POSTGRES_HOST,
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  database: process.env.POSTGRES_DATABASE,
})

export async function getData() {
  await pool.connect()
  

  try {
    const res = await pool.query('SELECT * FROM dog_breed')
    console.log(JSON.stringify(res.rows))
    return JSON.stringify(res.rows)
  } catch (err) {
    console.error(err);
  } 
}