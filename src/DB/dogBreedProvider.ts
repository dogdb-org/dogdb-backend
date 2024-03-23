import * as db from './postgres';

interface DogBreedRepository {
  getDogBreeds(): Promise<DogBreedDto[]>;
  getDogBreedsByBreedIdLike(idLike: string): Promise<DogBreedDto[]>;
}

/**
 * Represents a row of the dog_breed database table
 */
interface DogBreedRow {
  id: string;
  short_description: string;
  long_description: string;
  breed_characteristics: DogBreedCharacteristicRow[];
  breed_images: BreedImageRow[];
}

/**
 * Represents a row of the breed_characteristic database table
 */
interface DogBreedCharacteristicRow {
  characteristic_pk: string
}

/**
 * Represents a row of the breed_image database table
 */
interface BreedImageRow {
  image_path: string;
  alt_text: string;
}

/**
 * This class is the Data Transfer Object (DTO) representation of a dog breed. This is intended to separate the database
 * logic (such as Table or Class naming conventions and additional/extra columns) from the JSON reponse to be sent to and 
 * from the client. 
 */
class DogBreedDto {
  id: string;
  shortDescription: string;
  longDescription: string;
  breedCharacteristics: string[];
  breedImages: BreedImageDto[];

  constructor(dogBreed: DogBreedRow) {
    this.id = dogBreed.id
    this.shortDescription = dogBreed.short_description
    this.longDescription = dogBreed.long_description
    this.breedCharacteristics = dogBreed.breed_characteristics?.map(c => c.characteristic_pk)
    this.breedImages = dogBreed.breed_images?.map(img => { return new BreedImageDto(img.image_path, img.alt_text) })
    if (this.breedImages == undefined) {
      this.breedImages = []
    }
  }
}

class BreedImageDto {
  imagePath: string;
  altText: string;

  constructor(imagePath: string, altText: string = "") {
    this.imagePath = imagePath
    this.altText = altText
  }
}

export interface NewDogBreed {
  id: string;
  shortDescription: string;
  longDescription: string;
  imagePath: string;
}

class PostgresDogBreedProvider implements DogBreedRepository {
  async getDogBreeds(): Promise<DogBreedDto[]> {
    try {
      const dogBreeds: DogBreedRow[] = (await db.query('SELECT * FROM dog_breed', [])).rows
      await this.mapDogBreedRelations(dogBreeds);
      return dogBreeds.map(d => new DogBreedDto(d))
    } catch (error: any) {
      throw new Error('Error fetching dog breeds: ' + error.message);
    }
  }

  /**
   * This method takes a list of {@link DogBreedRow}s and executes the queries needed to fill out the relationships of this
   * DogBreedRow entity. Currently queries for dog breed characteristics and breed images.
   * @param dogBreeds The array of DogBreedRows
   */
  private async mapDogBreedRelations(dogBreeds: DogBreedRow[]) {
    await Promise.all(dogBreeds.map(async (breed) => {
      breed.breed_characteristics = await this.getBreedCharacteristicsByBreedId(breed.id);
      console.log(breed.breed_characteristics);
      breed.breed_images = await this.getBreedImagesByBreedId(breed.id);
      console.log(breed.breed_images);
    }));
  }

  async getBreedCharacteristicsByBreedId(id: string): Promise<DogBreedCharacteristicRow[]> {
    return (await db.query('SELECT characteristic_pk FROM breed_characteristic WHERE breed_id = $1', [id])).rows
  }

  async getBreedImagesByBreedId(id: string): Promise<BreedImageRow[]> {
    return (await db.query('SELECT image_path FROM breed_image WHERE breed_id = $1', [id])).rows
  }

  async getDogBreedsByBreedIdLike(idLike: string): Promise<DogBreedDto[]> {
    try {
      const dogBreeds: DogBreedRow[] = (
        await db.query("select * from dog_breed db where db.id like ('%$1%')", [
          idLike,
        ])
      ).rows;
      await this.mapDogBreedRelations(dogBreeds);
      return dogBreeds.map(d => new DogBreedDto(d))
    } catch (error: any) {
      throw new Error('Error fetching dog breeds: ' + error.message);
    }
  }

  /**
   * Creates a dog breed. This method takes the DTO representation and inserts the appropriate database table rows 
   * within a transaction. If an exception occurs, the transaction will be rolled back.
   * @param newDogBreed The DTO representation of the dog breed to save to the database.
   * @returns Returns the {@link NewDogBreed} DTO representation of the created dog breed.
   */
  async createDogBreed(newDogBreed: NewDogBreed): Promise<DogBreedDto> {
    const client = await db.pool.connect();
    try {
      client.query("BEGIN")
      const { id, shortDescription, longDescription, imagePath } = newDogBreed;
      const dogBreed: DogBreedRow = (
        await client.query(
          'INSERT INTO dog_breed (id, short_description, long_description) VALUES ($1, $2, $3) RETURNING *',
          [id, shortDescription, longDescription]
        )
      ).rows[0];

      const img: BreedImageRow = (
        await client.query(
          'INSERT INTO breed_image (image_path, breed_id) VALUES ($1, $2) RETURNING *',
          [imagePath, id]
        )
      ).rows[0];
      const dogBreedDto = new DogBreedDto(dogBreed)
      dogBreedDto.breedImages.push(new BreedImageDto(img.image_path))
      client.query("COMMIT")
      return dogBreedDto
    } catch (error: any) {
      client.query("ROLLBACK")
      throw new Error('Error creating dog breed: ' + error.message);
    } finally {
      client.release()
    }
  }
}

export default new PostgresDogBreedProvider();
