import usersService, { UsersService } from "./users.service";
import { Request, Response } from 'express';

type UsersController = {
  getAll(req: Request, res: Response): void;

  getOne(): void;

  create(): void;

  update(): void;

  deleteOne(): void;
}

const makeUsersController = (usersService: UsersService): UsersController => {
  const getAll = (req: Request, res: Response): void => {
    usersService.getAll().then((data) => {
      res.json({ status: 'ok', data: data });
      res.status(200);
    }).catch((err) => {
      res.json({ error: err });
      res.status(400);
    });
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
