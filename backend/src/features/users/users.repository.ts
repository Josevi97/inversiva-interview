import UserEntity from "./user.entity";

export type UsersRepository = {
  getAll(): Promise<UserEntity[]>
}

const makeUsersRepository = () => {
  const getAll = async (): Promise<UserEntity[]> => {
    return UserEntity.findAll();
  }

  return {
    getAll,
  }
}

export default makeUsersRepository();
