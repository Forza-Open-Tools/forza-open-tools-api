"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.down = exports.up = void 0;
const tables_1 = __importDefault(require("../src/lib/tables"));
async function up(knex) {
    await knex.schema.createTable(tables_1.default.makes, (tbl) => {
        tbl.increments('id');
        tbl.string('display_name').notNullable();
        tbl.string('manufacturer_code', 3).notNullable();
        tbl.integer('country_id').unsigned().notNullable();
    });
}
exports.up = up;
async function down(knex) {
    await knex.schema.dropTable(tables_1.default.makes);
}
exports.down = down;
//# sourceMappingURL=20220216115259_car_makes.js.map