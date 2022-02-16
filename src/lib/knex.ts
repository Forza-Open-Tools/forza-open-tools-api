import Knex from 'knex';
import { KnexQuery } from './types';
import { logger } from './logger';
import config from '../../knexfile';

const knex = Knex(config);

if (process.env.NODE_ENV === 'development') {
    const queryTimes: any = {};

    knex.on('query', (query: KnexQuery): void => {
        queryTimes[query.__knexQueryUid] = {
            sql: query.sql,
            bindings: query.bindings,
            timestamp: new Date().getTime()
        };
    });

    knex.on('query-response', (response: any, query: KnexQuery): void => {
        const { timestamp, sql, bindings }: { timestamp: number; sql: string; bindings: string[] } =
            queryTimes[query.__knexQueryUid];

        const elapsedMs: string = (new Date().getTime() - timestamp).toFixed(3);
        const statement = bindings.reduce(
            (prev: string, cur: string): string => prev.replace('?', cur),
            sql
        );

        logger.knex?.debug({ sql: { statement, ms: elapsedMs } }, 'Executed query.');
    });

    knex.on('query-error', (response: any, query: KnexQuery): void => {
        const { timestamp, sql, bindings }: { timestamp: number; sql: string; bindings: string[] } =
            queryTimes[query.__knexQueryUid];

        const elapsedMs: string = (new Date().getTime() - timestamp).toFixed(3);
        const statement = bindings.reduce(
            (prev: string, cur: string): string => prev.replace('?', cur),
            sql
        );

        logger.knex?.error({ sql: { statement, ms: elapsedMs } }, 'Query error.');
    });
}

export default knex;
