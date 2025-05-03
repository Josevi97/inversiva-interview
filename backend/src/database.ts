import { Sequelize } from "sequelize";
import { DATABASE_HOST, DATABASE_NAME, DATABASE_PASSWORD, DATABASE_USER } from "./config";

const sequalize = new Sequelize({
  dialect: 'mysql',
  host: DATABASE_HOST,
  username: DATABASE_USER,
  password: DATABASE_PASSWORD,
  database: DATABASE_NAME,
});

export default sequalize;
