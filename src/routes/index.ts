import { Router } from 'express';
import * as makes from './makes/Router';
import * as cars from './cars/Router';

const router: Router = Router();
router.use(makes.path, makes.router);
router.use(cars.path, cars.router);

export default router;
