const express = require('express');
const categoryModel = require('../models/catagory.model');

const route = express.Router();


route.get('/', async function (req, res) {
    // const list = [
    //     { CatID: 1, Catname: 'Laptop' },
    //     { CatID: 2, Catname: 'Tablet' },
    //     { CatID: 3, Catname: 'Smartphone' }
    // ];
    const list = await categoryModel.all();
    res.render('vwCategories/list', {
        categories: list,
        empty: list.length == 0
    });
})

route.get('/add', function (req, res) {
    res.render('vwCategories/add');
})

route.post('/add', async function (req, res) {
    const entity = {
        name: req.body.txtCategoryName
    }
    await categoryModel.add(entity);
    res.render('vwCategories/add');
})

route.get('/edit', async function (req, res) {
    const id = +req.query.id || -1;
    const rows = await categoryModel.single(id)
    if (rows.length === 0)
        return đres.send('Invalid parameter');
    const category = rows[0];
    res.render('vwCategories/edit', {
        category
    });
})

route.post('/del', async function (req, res) {
    await categoryModel.del(req.body.id);
    res.redirect('/admin/categories');
})

route.post('/upd', async function (req, res) {
    await categoryModel.patch(req.body);
    res.redirect('/admin/categories');
})


module.exports = route;