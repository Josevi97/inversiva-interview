import UserEntity from './user.entity';
import usersRepository, { UsersRepository } from './users.repository';
export type UsersService = {
  getAll(): Promise<UserEntity[]>;
  getOne(): void;
  create(): void;
  update(): void;
  deleteOne(): void;
}

const data = [];

const makeUsersService = (usersRepository: UsersRepository): UsersService => {
  const getAll = async (): Promise<UserEntity[]> => {
    return usersRepository.getAll();
  }

  const getOne = (): void => {
    console.log('getting one');
  }

  const create = (): void => {
    console.log('creating');
  }

  const update = (): void => {
    console.log('updating');
  }

  const deleteOne = (): void => {
    console.log('deleting');
  }

  return {
    getAll,
    getOne,
    create,
    update,
    deleteOne
  }
}

export default makeUsersService(usersRepository);
