import Router from 'express';
import userController from './features/users/users.controller';

const router = Router();

router.get('/health', (req, res) => {
  res.json({ status: 'ok' });
  res.status(200);
} );


router.get('/users', userController.getAll);
router.post('/users', userController.create);
router.patch('/users/:id', userController.update);
router.delete('/users/:id', userController.deleteOne);

export default router;
