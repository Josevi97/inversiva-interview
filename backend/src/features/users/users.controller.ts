import UserCreateDto from "./user.create.dto";
import UserUpdateDto from "./user.update.dto";
import usersService, { UsersService } from "./users.service";
import { Request, Response } from 'express';

type UsersController = {
  getAll(req: Request, res: Response): void;

  create(req: Request, res: Response): void;

  update(req: Request, res: Response): void;

  deleteOne(req: Request, res: Response): void;
}

const makeUsersController = (usersService: UsersService): UsersController => {
  const getAll = (req: Request, res: Response): void => {
    console.log(req.body);
    usersService.getAll().then((data) => {
      res.json({ status: 'ok', data: data });
      res.status(200);
    }).catch((err) => {
      res.json({ error: err });
      res.status(400);
    });
  }

  const create = (req: Request, res: Response): void => {
    try {
      const userDto: UserCreateDto = {
        name: req.body.name,
        email: req.body.email,
        rol: req.body.role,
      }

      usersService.create(userDto).then((data) => {
        res.json({ status: 'ok', data: data });
        res.status(200);
      }).catch((err) => {
        res.json({ error: err });
        res.status(404);
      });
    } catch (error) {
      res.json({ status: 'error', error: error })
      res.status(400);
    }
  }

  const update = (req: Request, res: Response): void => {
    try {
      const userDto: UserUpdateDto = {
        name: req.body.name,
        email: req.body.email,
        role: req.body.role,
      }

      usersService.update(req.params.id, userDto).then((data) => {
        res.json({ status: 'ok', data: data });
        res.status(200);
      }).catch((err) => {
        res.json({ error: err });
        res.status(404);
      });
    } catch (error) {
      res.json({ status: 'error', error: error })
      res.status(400);
    }
  }

  const deleteOne = (req: Request, res: Response): void => {
    usersService.deleteOne(req.params.id).then((result) => {
      if (result) {
        res.status(201);
        res.json({ status: 'ok' });
      } else {
        res.status(401);
        res.json({ status: 'error' });
      }
    }).catch((err) => {
      res.json({ error: err });
      res.status(404);
    });
  }

 return {
    getAll,
    create,
    update,
    deleteOne
  }

};

export default makeUsersController(usersService);
