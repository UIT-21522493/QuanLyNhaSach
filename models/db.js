const pgp = require('pg-promise')({
    capSQL: true,
});

const schema = 'public';
const cn = {
    user: 'postgres',
    host: 'localhost',
    database: 'Bookstore',
    password: '123456',
    port: 5432,
    max: 30,
};
const db = pgp(cn);

exports.load = async (tbName, orderBy) => {
    const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
    const qStr = pgp.as.format(
        `SELECT * FROM $1 ORDER BY "${orderBy}" ASC `,
        table
    );

    try {
        const res = await db.any(qStr);
        return res;
    } catch (error) {
        console.log('error db/load: ', error);
    }
};

exports.loadCondition = async (tbName, orderBy, condition) => {
    const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
    const qStr =
        pgp.as.format('SELECT * FROM $1', table) +
        condition +
        ` ORDER BY "${orderBy}" ASC`;

    try {
        const res = await db.any(qStr);
        return res;
    } catch (error) {
        console.log('error db/loadCondition: ', error);
    }
};

exports.get = async (tbName, fieldName, value) => {
    const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
    const qStr = pgp.as.format(
        `SELECT * FROM $1 WHERE "${fieldName}"='${value}'`,
        table
    );
    //console.log(qStr);
    try {
        const res = await db.any(qStr);
        return res;
    } catch (error) {
        console.log('error db/get: ', error);
    }
};

exports.count = async (tbName, idFieldName, condition) => {
    const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
    const qStr =
        pgp.as.format(
            `SELECT count("${idFieldName}") AS "Size" FROM $1`,
            table
        ) + condition;
    //console.log(qStr);
    try {
        const res = await db.any(qStr);
        return res;
    } catch (error) {
        console.log('error db/count: ', error);
    }
};