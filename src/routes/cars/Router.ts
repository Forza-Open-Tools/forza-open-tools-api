import { NextFunction, Request, Response, Router } from 'express';
import { Car } from '../../lib/types';
import CarsController from './Controller';

export const path: string = '/cars';
export const router: Router = Router();

const controller: CarsController = new CarsController();

router.get('/', async (req: Request, res: Response, next: NextFunction) => {
    try {
        const makeId: number = Number.parseInt(req.query.makeId as string);
        const cars: Car[] = await controller.cars(makeId);

        res.json(cars);
    } catch (err) {
        next(err);
    }
});

router.get('/:carId', async (req: Request, res: Response, next: NextFunction) => {
    try {
        const carId: number = Number.parseInt(req.params.carId as string);
        const car: Car = await controller.car(carId);

        res.json(car);
    } catch (err) {
        next(err);
    }
});
