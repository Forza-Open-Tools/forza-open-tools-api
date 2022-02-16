import knex from '../../lib/knex';
import tbls from '../../lib/tables';
import { NotFoundError, Make } from '../../lib/types';

export default class MakesController {
    async make(makeId: number): Promise<Make> {
        const make: Make = await knex<Make>(tbls.makes).first('*').where('id', makeId);

        if (!make) {
            throw new NotFoundError(`Make #${makeId} does not exist.`);
        }

        return make;
    }

    async makes(): Promise<Make[]> {
        const makes: Make[] = await knex<Make>(tbls.makes).select('*');

        return makes;
    }
}
