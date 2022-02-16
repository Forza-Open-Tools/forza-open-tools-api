import Logger from 'bunyan';

export interface ApiLogger extends Logger {
  knex?: Logger;
  express?: Logger;
}

export class ApiError extends Error {
  status: number;
  publicMessage: string;
  privateMessage?: string;

  constructor(status: number, publicMessage: string, privateMessageOrError: string | Error) {
    super(publicMessage);

    this.status = status;
    this.publicMessage = publicMessage;

    if (privateMessageOrError instanceof Error) {
      this.privateMessage = privateMessageOrError.message;
      this.stack = privateMessageOrError.stack;
    }
  }
}

export class InternalServerError extends ApiError {
  constructor(messageOrError: string | Error) {
    super(500, 'Internal Server Error.', messageOrError);
  }
}

export class BadRequestError extends ApiError {
  constructor(messageOrError: string | Error) {
    super(400, 'Bad Request.', messageOrError);
  }
}

export class NotFoundError extends ApiError {
  constructor(messageOrError: string | Error) {
    super(404, 'Not Found.', messageOrError);
  }
}

export interface KnexQuery {
  __knexQueryUid: string;
  sql: string;
  bindings: string[];
}
