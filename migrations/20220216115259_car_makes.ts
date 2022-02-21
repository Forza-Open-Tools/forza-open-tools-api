import { Knex } from 'knex';
import tbls from '../src/lib/tables';

export async function up(knex: Knex): Promise<void> {
  await knex.schema.createTable(tbls.makes, (tbl) => {
    tbl.increments('id');
    tbl.string('display_name').notNullable();
    tbl.string('manufacturer_code', 3).notNullable();
    tbl.integer('country_id').unsigned().notNullable();
  });
}

export async function down(knex: Knex): Promise<void> {
  await knex.schema.dropTable(tbls.makes);
}
