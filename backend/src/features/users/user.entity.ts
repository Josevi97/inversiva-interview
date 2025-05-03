import { Model, Optional } from "sequelize";
import { DataType } from "sequelize-typescript";
import sequalize from "../../database";
import { User } from "./user";

type UserAttributes = User & { id: string }
type UserCreationAttributes = UserAttributes;

class UserEntity extends Model<UserAttributes, Optional<UserCreationAttributes, 'id'>> {
  declare id: string;
  declare name: string;
  declare email: string;
  declare role: number;
}

UserEntity.init(
  {
    id: {
      type: DataType.STRING,
      defaultValue: DataType.UUIDV4,
      allowNull: false,
      primaryKey: true,
    },
    name: {
      type: DataType.STRING,
      allowNull: false,
    },
    email: {
      type: DataType.STRING,
      allowNull: false
    },
    role: {
      type: DataType.INTEGER,
      allowNull: false
    },
  },
  {
    tableName: 'users',
    sequelize: sequalize,
  }
)

UserEntity.sync()
  .then(() => 'User table recreated')
  .catch(() => 'Error synchronizing database');

export default UserEntity;
