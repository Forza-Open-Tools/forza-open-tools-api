import { Knex } from 'knex';
import tbls from '../src/lib/tables';

export async function up(knex: Knex): Promise<void> {
  await knex.schema.createTable(tbls.cars, (tbl) => {
    tbl.increments('id');
    tbl.integer('make_id').unsigned().notNullable();
    tbl.integer('year').unsigned().notNullable();
    tbl.string('display_name').notNullable();
    tbl.string('model_short').notNullable();
    tbl.string('media_name').notNullable();
    tbl.integer('class_id').unsigned().notNullable();
    tbl.integer('car_type_id').unsigned().notNullable();
    tbl.integer('car_class_modifier').unsigned().notNullable();
    tbl.integer('family_model_id').unsigned().notNullable();
    tbl.integer('family_body_id').unsigned().notNullable();
    tbl.integer('engine_placement_id').unsigned().notNullable();
    tbl.integer('material_type_id').unsigned().notNullable();
    tbl.integer('powertrain_id').unsigned().notNullable();
    tbl.decimal('curb_weight', 7, 5).notNullable();
    tbl.decimal('weight_distribution', 3, 2).notNullable();
    tbl.tinyint('num_gears').unsigned().notNullable();
    tbl.integer('tire_brand_id').unsigned().notNullable();
    tbl.decimal('base_rarity', 2, 1).notNullable();
    tbl.smallint('front_tire_width_mm').unsigned().notNullable();
    tbl.tinyint('front_tire_aspect').unsigned().notNullable();
    tbl.tinyint('front_wheel_diameter_in').unsigned().notNullable();
    tbl.smallint('rear_tire_width_mm').unsigned().notNullable();
    tbl.tinyint('rear_tire_aspect').unsigned().notNullable();
    tbl.tinyint('rear_wheel_diameter_in').unsigned().notNullable();
    tbl.decimal('zero_sixty_time_sec', 5, 3).unsigned().notNullable();
    tbl.decimal('zero_one_hundred_time_sec', 6, 3).unsigned().notNullable();
    tbl.decimal('quarter_mile_time_sec', 6, 3).unsigned().notNullable();
    tbl.decimal('quarter_mile_speed_mph', 5, 2).unsigned().notNullable();
    tbl.decimal('top_speed_mph', 6, 3).unsigned().notNullable();
    tbl.integer('speed_limiter_id').unsigned().notNullable();
    tbl.integer('base_cost').unsigned().notNullable();
    tbl.decimal('performance_index', 5, 4).unsigned().notNullable();
  });
}

export async function down(knex: Knex): Promise<void> {
  await knex.schema.dropTable(tbls.cars);
}
