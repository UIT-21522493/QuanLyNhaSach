const express = require('express');
const productModel = require('../models/product.model');
const config = require('../config/default.json');

const route = express.Router();


route.get('/byCat/:CatID', async function (req, res) {
    for (const c of res.locals.lcCategories) {
        if (c.CatID === +req.params.CatID) {
            c.isActive = true;
        }
    }

    const page = req.params.page || 1;
    if (page < 0) page = 1;
    const offset = (page - 1) * config.pagination.limit;

    const total = await productModel.countByCat(req.params.CatID);
    const nPages = Math.ceil(total / config.pagination.limit);
    const page_items = [];
    for (let i = 1; i <= nPages; i++) {
        const item = {
            value: i,
            isActive: i === page
        }
        page_items.push(item);
    }
    const list = await productModel.pageByCat(req.params.CatID, config.pagination.limit, offset);
    res.render('vwProducts/byCat', {
        product: list,
        empty: list.length == 0,
        page_items,
        prev_value: page - 1,
        next_value: page + 1,
        can_go_prev: page > 1,
        can_go_next: page < nPages
    });
})

module.exports = route;