import { NextFunction, Request, Response } from 'express';
import { logger } from '../lib/logger';

const logging = (req: Request, res: Response, next: NextFunction): void => {
  logger.express?.info({ req }, 'Incoming request.');

  const { end } = res;
  Object.assign(res, {
    end(arg0: any, arg1: any, arg2: any) {
      logger.express?.info({ res: this }, 'Outgoing response.');
      end.apply(this, [arg0, arg1, arg2]);
    }
  });

  next();
};

export default logging;
