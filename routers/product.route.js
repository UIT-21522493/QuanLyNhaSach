const express = require('express');
const productModel = require('../models/product.model');

const route = express.Router();


route.get('/', async function (req, res) {
    const list = await productModel.all();
    res.render('vwProducts/list', {
        product: list,
        empty: list.length == 0
    });
})

module.exports = route;