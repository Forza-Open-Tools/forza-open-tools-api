import knex from '../../lib/knex';
import tbls from '../../lib/tables';
import { Car, NotFoundError } from '../../lib/types';

export default class CarsController {
    async car(carId: number): Promise<Car> {
        const car: Car = await knex<Car>(tbls.cars).first('*').where('id', carId);

        if (!car) {
            throw new NotFoundError(`Car #${carId} does not exist.`);
        }

        return car;
    }

    async cars(makeId: number): Promise<Car[]> {
        const cars: Car[] = await knex<Car>(tbls.cars).select('*').where('make_id', makeId);

        return cars;
    }
}
