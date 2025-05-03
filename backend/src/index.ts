import express from 'express';
import router from './router';
import database from './database';

const app = express();
const PORT = 3000;

const bootstrap = async () => {
  await database.authenticate();
  await database.sync();

  app.use(express.json());
  app.use('/api', router);

  app.listen(PORT, () => {
    console.log('server running at port ', PORT);
  });
}

bootstrap().catch((err) => console.error(err));
