"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.down = exports.up = void 0;
const tables_1 = __importDefault(require("../src/lib/tables"));
async function up(knex) {
    await knex.schema.createTable(tables_1.default.cars, (tbl) => {
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
exports.up = up;
async function down(knex) {
    await knex.schema.dropTable(tables_1.default.cars);
}
exports.down = down;
//# sourceMappingURL=20220216112322_cars.js.map