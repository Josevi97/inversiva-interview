export type UsersService = {
  getAll(): void;
  getOne(): void;
  create(): void;
  update(): void;
  deleteOne(): void;
}

const makeUsersService = (): UsersService => {
  const getAll = (): void => {
    console.log('getting all');
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

export default makeUsersService();
