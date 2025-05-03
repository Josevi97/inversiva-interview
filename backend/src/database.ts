import { Sequelize } from "sequelize";

const sequalize = new Sequelize({
  dialect: 'mysql',
  host: 'localhost',
  username: 'root',
  password: 'root',
  database: 'inversiva',
});

export default sequalize;
