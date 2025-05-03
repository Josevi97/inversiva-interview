import express from 'express';
import router from './router';
import database from './database';
import { SERVER_PORT } from './config';
import { config } from 'dotenv';

const app = express();

const bootstrap = async () => {
  await config();

  await database.authenticate();
  await database.sync();

  app.use(express.json());
  app.use('/api', router);

  app.listen(SERVER_PORT, () => {
    console.log('server running at port ', SERVER_PORT);
  });
}

bootstrap().catch((err) => console.error(err));
