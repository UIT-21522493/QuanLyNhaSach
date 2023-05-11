const db = require('../utils/db');

const TBL_PRODUCTS = `products`;

module.exports = {
    all: function () {
        return db.load(`select * from ${TBL_PRODUCTS}`);
    },
    allByCat: function (CatID) {
        return db.load(`select * from ${TBL_PRODUCTS} where CatID = ${CatID}`);
    },
    pageByCat: function (CatID, limit, offset) {
        return db.load(`select * from ${TBL_PRODUCTS} where CatID = ${CatID} limit ${limit} offset ${offset}`);
    },
    countByCat: async function (CatID) {
        const rows = await db.load(`select count(*) as total from ${TBL_PRODUCTS} where CatID = ${CatID}`);
        return rows[0].total;
    }
}   