import { NextFunction, Request, Response } from 'express';
import { NotFoundError } from '../lib/types';

const notFound = (req: Request, res: Response, next: NextFunction): void => {
  next(new NotFoundError('Unknown route.'));
};

export default notFound;
