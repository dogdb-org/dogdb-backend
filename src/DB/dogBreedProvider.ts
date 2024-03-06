import * as db from './postgres'

interface DogBreedRepository {
  getDogBreeds(): Promise<any>
  getDogBreedsByBreedIdLike(idLike: string) : Promise<any>
}

class PostgresDogBreedProvider implements DogBreedRepository {

  async getDogBreeds(): Promise<any> {
    return JSON.stringify(
      (
        await db.query("SELECT * FROM dog_breed", [])
      ).rows
    )
  }

  async getDogBreedsByBreedIdLike(idLike: string): Promise<any> {
    return JSON.stringify(
      (
        await db.query("select * from dog_breed db where db.id like ('%$1%')", [idLike])
      ).rows
    )
  }
}

export default new PostgresDogBreedProvider()
