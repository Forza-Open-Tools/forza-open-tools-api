import { NextFunction, Request, Response, Router } from 'express';
import { Make } from '../../lib/models';
import MakesController from './Controller';

export const path: string = '/makes';
export const router: Router = Router();

const controller: MakesController = new MakesController();

router.get('/', async (req: Request, res: Response, next: NextFunction): Promise<void> => {
  try {
    const cars: Make[] = await controller.makes();

    res.json(cars);
  } catch (err) {
    next(err);
  }
});

router.get('/:makeId', async (req: Request, res: Response, next: NextFunction): Promise<void> => {
  try {
    const makeId: number = Number.parseInt(req.params.makeId as string);
    const make: Make = await controller.make(makeId);

    res.json(make);
  } catch (err) {
    next(err);
  }
});
