import {
  ApiError,
  BunyanSerializedError,
  BunyanSerializedRequest,
  BunyanSerializedResponse
} from './types';

function fullErrorStack(err: any): string {
  let ret = err.stack || err.toString();
  if (err.cause && typeof err.cause === 'function') {
    const cex = err.cause();
    if (cex) {
      ret += `\nCaused by: ${fullErrorStack(cex)}`;
    }
  }

  return ret;
}

export const err = function (err: ApiError): BunyanSerializedError | Error {
  if (!err || !err.stack) {
    return err;
  }

  return {
    privateMessage: err.privateMessage,
    message: err.message,
    name: err.name,
    stack: fullErrorStack(err),
    status: err.status
  };
};

export const req = function (req: any): BunyanSerializedRequest {
  return {
    method: req.method,
    url: req.url,
    headers: req.headers,
    remotePort: req.socket.remotePort,
    remoteAddress: req.socket.remoteAddress,
    ip: req.ip
  };
};

export const res = function (res: any): BunyanSerializedResponse {
  return {
    statusCode: res.statusCode,
    header: res._header
  };
};
