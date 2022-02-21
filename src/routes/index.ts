import { Router } from 'express';
import * as makes from './makes';
import * as cars from './cars';

const router: Router = Router();
router.use(makes.path, makes.router);
router.use(cars.path, cars.router);

export default router;
