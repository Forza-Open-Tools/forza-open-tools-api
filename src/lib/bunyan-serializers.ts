import { ApiError } from './types';

function getFullErrorStack(err: any) {
    let ret = err.stack || err.toString();
    if (err.cause && typeof err.cause === 'function') {
        const cex = err.cause();
        if (cex) {
            ret += `\nCaused by: ${getFullErrorStack(cex)}`;
        }
    }

    return ret;
}

export const err = function (err: ApiError) {
    if (!err || !err.stack) {
        return err;
    }

    return {
        privateMessage: err.privateMessage,
        message: err.message,
        name: err.name,
        stack: getFullErrorStack(err),
        status: err.status
    };
};

export const req = function (req: any) {
    return {
        method: req.method,
        url: req.url,
        headers: req.headers,
        remotePort: req.socket.remotePort,
        remoteAddress: req.socket.remoteAddress,
        ip: req.ip
    };
};

export const res = function (res: any) {
    return {
        statusCode: res.statusCode,
        header: res._header
    };
};
