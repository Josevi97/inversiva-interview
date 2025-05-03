import { Model } from "sequelize";
import { Column, DataType, Table } from "sequelize-typescript";

@Table({ tableName: 'users' })
class UserEntity extends Model {
  @Column({
    type: DataType.STRING,
    allowNull: false
  })
  name!: string;

  @Column({
    type: DataType.STRING,
    allowNull: false
  })
  email!: string;

  /**
   * Roles are not specified in the requirements so I am gonna use a int
   * to determine the role. By default, 0 is the default user and 1 is an admin
   */
  @Column({
    type: DataType.INTEGER,
    allowNull: false
  })
  rol!: number;
}

export default UserEntity;
