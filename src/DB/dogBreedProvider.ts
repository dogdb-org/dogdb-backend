import * as db from './postgres';

interface DogBreedRepository {
  getDogBreeds(): Promise<DogBreed[]>;
  getDogBreedsByBreedIdLike(idLike: string): Promise<DogBreed[]>;
}

interface DogBreed {
  id: string;
  shortDescription: string;
  longDescription: string;
  imagePath: string;
}

export interface NewDogBreed {
  id: string;
  shortDescription: string;
  longDescription: string;
  imagePath: string;
}

class PostgresDogBreedProvider implements DogBreedRepository {
  async getDogBreeds(): Promise<DogBreed[]> {
    try {
      return (await db.query('SELECT * FROM dog_breed', [])).rows;
    } catch (error: any) {
      throw new Error('Error fetching dog breeds: ' + error.message);
    }
  }

  async getDogBreedsByBreedIdLike(idLike: string): Promise<DogBreed[]> {
    try {
      return (
        await db.query("select * from dog_breed db where db.id like ('%$1%')", [
          idLike,
        ])
      ).rows;
    } catch (error: any) {
      throw new Error('Error fetching dog breeds: ' + error.message);
    }
  }

  async createDogBreed(newDogBreed: NewDogBreed): Promise<void> {
    try {
      const { id, shortDescription, longDescription, imagePath } = newDogBreed;
      return (
        await db.query(
          'INSERT INTO dog_breed (id, short_description, long_description, image_path) VALUES ($1, $2, $3, $4) RETURNING *',
          [id, shortDescription, longDescription, imagePath]
        )
      ).rows[0];
    } catch (error: any) {
      throw new Error('Error creating dog breed: ' + error.message);
    }
  }
}

export default new PostgresDogBreedProvider();
