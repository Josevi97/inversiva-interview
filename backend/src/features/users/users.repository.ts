import UserCreateDto from "./user.create.dto";
import UserEntity from "./user.entity";
import UserUpdateDto from "./user.update.dto";

export type UsersRepository = {
  getAll(): Promise<UserEntity[]>
  create(userDto: UserCreateDto): Promise<UserEntity | null>
  update(id: string, userDto: UserUpdateDto): Promise<UserEntity | null>
  deleteOne(id: string): Promise<boolean>
}

const makeUsersRepository = () => {
  const getAll = async (): Promise<UserEntity[]> => {
    return UserEntity.findAll();
  }

  const create = async (userDto: UserCreateDto): Promise<UserEntity> => {
    return UserEntity.create({
      name: userDto.name,
      email: userDto.email,
      role: userDto.rol,
    });
  }

  const update = async (id: string, userDto: UserUpdateDto): Promise<UserEntity> => {
    const user = await UserEntity.findByPk(id);
    if (!user) {
      throw new Error('User not found');
    }

    if (userDto.name != undefined) {
      user!.name = userDto.name;
    }
    if (userDto.email != undefined) {
      user!.email = userDto.email;
    }
    if (userDto.role != undefined) {
      user!.role = userDto.role;
    }

    return user.save();
  }

  const deleteOne = async (id: string): Promise<boolean> => {
    const result = await UserEntity.destroy({ where: { id: id } });
    return result > 0;
  }

  return {
    getAll,
    create,
    update,
    deleteOne,
  }
}

export default makeUsersRepository();
