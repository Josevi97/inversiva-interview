import usersService, { UsersService } from "./users.service";

type UsersController = {
  getAll(req: any, res: any): void;

  getOne(): void;

  create(): void;

  update(): void;

  deleteOne(): void;
}

const makeUsersController = (usersService: UsersService): UsersController => {
  const getAll = (req: any, res: any): void => {
    usersService.getAll();
    res.json({ status: 'ok' });
    res.status(200);
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

};

export default makeUsersController(usersService);
