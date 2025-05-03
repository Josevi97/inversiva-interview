import express from 'express';
import router from './router';

const app = express();
const PORT = 3000;

app.use('/api', router);

app.listen(PORT, () => {
  console.log('server running at port ', PORT);
});
