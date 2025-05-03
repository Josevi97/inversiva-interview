import UserCreateDto from './user.create.dto';
import UserEntity from './user.entity';
import UserUpdateDto from './user.update.dto';
import usersRepository, { UsersRepository } from './users.repository';
export type UsersService = {
  getAll(): Promise<UserEntity[]>;
  create(userDto: UserCreateDto): Promise<UserEntity | null>;
  update(id: string, userDto: UserUpdateDto): Promise<UserEntity | null>;
  deleteOne(id: string): Promise<boolean>;
}

const makeUsersService = (usersRepository: UsersRepository): UsersService => {
  const getAll = async (): Promise<UserEntity[]> => {
    return usersRepository.getAll();
  }

  const create = async (userDto: UserCreateDto): Promise<UserEntity | null> => {
    return usersRepository.create(userDto);
  }

  const update = async (id: string, userDto: UserUpdateDto): Promise<UserEntity | null> => {
    return usersRepository.update(id, userDto);
  }

  const deleteOne = (id: string): Promise<boolean> => {
    return usersRepository.deleteOne(id);
  }

  return {
    getAll,
    create,
    update,
    deleteOne
  }
}

export default makeUsersService(usersRepository);
