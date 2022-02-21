import { NextFunction, Request, Response } from 'express';
import { ApiError, InternalServerError } from '../lib/types';
import { logger } from '../lib/logger';

const error = (err: Error, req: Request, res: Response, next: NextFunction): void => {
  let apiError: any = err;

  if (!(err instanceof ApiError)) {
    apiError = new InternalServerError(err);
  }

  logger.express?.error(apiError);

  res.status(apiError.status).json({ status: apiError.status, message: apiError.message });
  next();
};

export default error;
