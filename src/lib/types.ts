import Logger from 'bunyan';

export interface Car {
    id: number;
    year: number;
    makeId: number;
    displayName: string;
    modelShort: string;
    mediaName: string;
    classId?: number;
    carTypeId?: number;
    carClassModifier?: number;
    familyModelId?: number;
    familyBodyId?: number;
    enginePlacementId?: number,
    materialTypeId?: number,
    powertrainId?: number;
    curbWeight?: number;
    weightDistribution?: number;
    numGears?: number;
    tireBrandId?: number;
    baseRarity?: number;
    frontTireWidthMM?: number;
    frontTireAspect?: number;
    frontWheelDiameterIN?: number;
    rearTireWidthMM?: number,
    rearTireAspect?: number,
    rearWheelDiameterIN?: number,
    zeroSixtyTimeSec?: number;
    zeroOneHundredTimeSec?: number;
    quarterMileTimeSec?: number;
    quarterMileSpeedMPH?: number;
    topSpeedMPH?: number;
    speedLimiterId?: number;
    baseCost?: number;
    performanceIndex?: number;
}

export interface Make {
    id: number;
    displayName: string;
    manufacturerCode: string;
    countryId?: number;
}

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