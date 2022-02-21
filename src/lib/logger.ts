import bunyan, { LogLevel } from 'bunyan';
import RotatingFileStream from 'bunyan-rotating-file-stream';
import PrettyStream from 'bunyan-prettystream';
import { ApiLogger } from './types';
import { name } from '../../package.json';
import { err, req, res } from './bunyan-serializers';

const nodeEnv: string = process.env.NODE_ENV || 'development';

// Pretty print stdout stream
const prettyStdOut: PrettyStream = new PrettyStream();
prettyStdOut.pipe(process.stdout);

const level: LogLevel = nodeEnv === 'development' ? 'trace' : 'info';

// Define output streams
const streams: { stream: any }[] = [{ stream: prettyStdOut }];

// Log to file if running production
if (nodeEnv === 'production') {
  const rotatingFileStream: RotatingFileStream = new RotatingFileStream({
    path: './logs/%Y-%m-%d.log',
    period: '1d',
    totalFiles: 10,
    rotateExisting: true,
    threshold: '10m',
    totalSize: '20m',
    gzip: true
  });

  streams.push({ stream: rotatingFileStream });
}

export const logger: ApiLogger = bunyan.createLogger({
  name,
  level,
  streams,
  serializers: {
    err,
    req,
    res
  }
});

logger.knex = logger.child({ type: 'knex' });
logger.express = logger.child({ type: 'express' });

if (nodeEnv === 'development') {
  logger.warn('Development environment detected. File stream is disabled.');
}

process.on('uncaughtException', (error: Error): void => logger.fatal(error));
