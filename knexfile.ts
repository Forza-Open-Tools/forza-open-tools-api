import * as dotenv from 'dotenv';

dotenv.config();

export default {
    client: process.env.SQL_CLIENT,
    connection: {
        host: process.env.SQL_HOST,
        user: process.env.SQL_USER,
        password: process.env.SQL_PASSWORD,
        database: process.env.SQL_DATABASE
    }
};

