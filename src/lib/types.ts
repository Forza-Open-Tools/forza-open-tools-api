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

export interface BunyanSerializedError {
  privateMessage?: string;
  message: string;
  name: string;
  stack: string;
  status: number;
}

export interface BunyanSerializedRequest {
  method: string;
  url: string;
  headers: { [name: string]: string };
  remotePort: string;
  remoteAddress: string;
  ip: string;
}

export interface BunyanSerializedResponse {
  statusCode: number;
  header: { [name: string]: string };
}

export interface KnexQueryStats {
  sql: string;
  bindings: string[];
  timestamp: number;
}

export interface KnexQueryDictionary {
  [uid: string]: KnexQueryStats;
}
