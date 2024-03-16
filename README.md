# DOG-DB

DOG-DB is a project that includes an Express server written in TypeScript. The server provides a basic endpoint at '/', responding with "Hello World!".

## Getting Started

Before running the project, make sure you have Node.js and npm (or yarn) installed on your machine. For local database instance, have docker installed.

There's a docker-compose.yaml file at the top of the project that has the postgres database service defined. Assuming docker is installed, you can run

```bash
docker-compose up -d
```

which should turn on the postgres db. After that, use the T-SQL in the /scripts/init.sql file to create the schema and table and test data if it doesn't already exist. The data should remain persistent when stopping the container, but if you want to start fresh, you can do a

```bash
docker-compose down -v
```

where the -v argument will drop the data volumes, deleting all the database data.

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/dogdb-org/dobdb-backend.git
   ```

2. Navigate to the project directory:

```bash
cd dogdb-backend
```

3. Initialize the project:

```bash
npm install
or
yarn
```

### Running the Server

To run the server, use the following npm (or yarn) scripts:

For production:

```bash
npm start
or
yarn start
```

For development with automatic restart (using nodemon):

```bash
npm run dev
or
yarn dev
```

### Supabase Connection

To connect to the Supabase server, please contact the project maintainers:

LMD
Adam

at Discord server

### License

This project is licensed under the MIT License - see the LICENSE file for details.
