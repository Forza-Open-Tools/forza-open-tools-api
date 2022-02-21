import * as dotenv from 'dotenv';
import express, { Application } from 'express';
import cors from 'cors';
import helmet from 'helmet';
import { name } from '../package.json';
import routes from './routes';
import { logger } from './lib/logger';
import logging from './middleware/logging';
import error from './middleware/error';
import notFound from './middleware/not-found';

dotenv.config();

if (!process.env.PORT) {
  throw new Error('Env variable "PORT" is not set. Exiting.');
}

const port: number = Number.parseInt(process.env.PORT as string);
const app: Application = express();

app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(logging);
app.use(routes);
app.get('*', notFound);
app.use(error);

app.listen(port, (): void => logger.express?.info(`${name} listening on port ${port}.`));
