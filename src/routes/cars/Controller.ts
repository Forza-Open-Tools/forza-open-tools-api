import knex from '../../lib/knex';
import tbls from '../../lib/tables';
import { Car, NotFoundError } from '../../lib/types';

export default class CarsController {
    async car(carId: number): Promise<Car> {
        const car: Car = await knex<Car>(tbls.cars)
            .first(
                'id',
                'make_id AS makeId',
                'year',
                'display_name AS displayName',
                'model_short AS modelShort',
                'media_name AS mediaName',
                'class_id AS classId',
                'car_type_id AS carTypeId',
                'car_class_modifier AS carClassModifier',
                'family_model_id AS familyModelId',
                'family_body_id AS familyBodyId',
                'engine_placement_id AS enginePlacementId',
                'material_type_id AS materialType',
                'powertrain_id AS powertrainId',
                'curb_weight AS curbWeight',
                'weight_distribution AS weightDistribution',
                'num_gears AS numGears',
                'tire_brand_id AS tireBrandId',
                'base_rarity AS baseRarity',
                'front_tire_width_mm AS frontTireWidthMm',
                'front_tire_aspect AS frontTireAspect',
                'front_wheel_diameter_in AS frontWheelDiameterIn',
                'rear_tire_width_mm AS rearTireWidthMm',
                'rear_tire_aspect AS rearTireAspect',
                'rear_wheel_diameter_in AS rearWheelDiameterIn',
                'zero_sixty_time_sec AS zeroSixtyTimeSec',
                'zero_one_hundred_time_sec AS zeroOneHundredTimeSec',
                'quarter_mile_time_sec AS quarterMileTimeSec',
                'quarter_mile_speed_mph AS quarterMileSpeedMph',
                'top_speed_mph AS topSpeedMph',
                'speed_limiter_id AS speedLimiterId',
                'base_cost AS baseCost',
                'performance_index AS performanceIndex'
            )
            .where('id', carId);

        if (!car) {
            throw new NotFoundError(`Car #${carId} does not exist.`);
        }

        return car;
    }

    async cars(makeId: number): Promise<Car[]> {
        const cars: Car[] = await knex<Car>(tbls.cars)
            .select(
                'id',
                'make_id AS makeId',
                'year',
                'display_name AS displayName',
                'model_short AS modelShort',
                'media_name AS mediaName',
                'class_id AS classId',
                'car_type_id AS carTypeId',
                'car_class_modifier AS carClassModifier',
                'family_model_id AS familyModelId',
                'family_body_id AS familyBodyId',
                'engine_placement_id AS enginePlacementId',
                'material_type_id AS materialType',
                'powertrain_id AS powertrainId',
                'curb_weight AS curbWeight',
                'weight_distribution AS weightDistribution',
                'num_gears AS numGears',
                'tire_brand_id AS tireBrandId',
                'base_rarity AS baseRarity',
                'front_tire_width_mm AS frontTireWidthMm',
                'front_tire_aspect AS frontTireAspect',
                'front_wheel_diameter_in AS frontWheelDiameterIn',
                'rear_tire_width_mm AS rearTireWidthMm',
                'rear_tire_aspect AS rearTireAspect',
                'rear_wheel_diameter_in AS rearWheelDiameterIn',
                'zero_sixty_time_sec AS zeroSixtyTimeSec',
                'zero_one_hundred_time_sec AS zeroOneHundredTimeSec',
                'quarter_mile_time_sec AS quarterMileTimeSec',
                'quarter_mile_speed_mph AS quarterMileSpeedMph',
                'top_speed_mph AS topSpeedMph',
                'speed_limiter_id AS speedLimiterId',
                'base_cost AS baseCost',
                'performance_index AS performanceIndex'
            )
            .where('make_id', makeId);

        return cars;
    }
}
