const db = require('../utils/db');

const TBL_CATEGORIES = `categories`;

module.exports = {
    all: function () {
        return db.load(`SELECT * FROM ${TBL_CATEGORIES}`);
    },
    allWithDetails: function () {
        return db.load(`SELECT c.*, COUNT(p.ProID) AS num_pro
                        FROM ${TBL_CATEGORIES} c LEFT JOIN products p on c.CatID = p.CatID
                        GROUP BY c.CatID, c.CatName`);
    },
    single: function (id) {
        return db.load(`SELECT * FROM ${TBL_CATEGORIES} WHERE id = ${id}`);
    },
    add: function (entity) {
        return db.add(TBL_CATEGORIES, entity);
    },
    patch: function (entity) {
        const condition = {
            id: entity.id
        }
        delete entity.id;
        return db.patch(TBL_CATEGORIES, entity, condition);
    },
    del: function (id) {
        const condition = {
            id: id
        }
        return db.del(TBL_CATEGORIES, condition);
    }
};