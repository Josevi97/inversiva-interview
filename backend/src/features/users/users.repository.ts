import UserEntity from "./user.entity";

export type UsersRepository = {
  getAll(): Promise<UserEntity[]>
  deleteOne(id: string): Promise<boolean>
}

const makeUsersRepository = () => {
  const getAll = async (): Promise<UserEntity[]> => {
    return UserEntity.findAll();
  }

  const deleteOne = async (id: string): Promise<boolean> => {
    const result = await UserEntity.destroy({ where: { id: id } });
    return result > 0;
  }

  return {
    getAll,
    deleteOne,
  }
}

export default makeUsersRepository();
