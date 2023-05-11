const express = require('express');
const moment = require('moment');
const bcrypt = require('bcryptjs');
const userModel = require('../models/user.model');
const productModel = require('../models/product.model');

const config = require('../config/default.json');

const route = express.Router();


route.get('/login', async function (req, res) {
    res.render('vwAccount/login', {
        layout: false
    });
})

route.post('/login', async function (req, res) {
    const user = await singleByUserName(req.body.username);
    console.log(username);
    if (user === null) {
        return res.render('vwAccount/login', {
            layout: false,
            err: 'Invalid username or password!!!'
        })
    }

    const rs = bcrypt.compareSync(req.body.password, username.password_hash);
    if (rs === false) {
        return res.render('vwAccount/login', {
            layout: false,
            err: 'Invalid username or password!!!'
        })
    }
})

route.get('/register', async function (req, res) {
    res.render('vwAccount/profile');
})

route.post('/register', async function (req, res) {
    const dob = moment(req.body.dob, 'DD/MM/YYYY').format('YYYY-MM-DD');
    const password_hash = bcrypt.hashSync(req.body.password, config.authentication.saltRounds);
    const entity = {
        username: req.body.username,
        password_hash,
        name: req.body.name,
        email: req.body.email,
        dob,
        permission: 0
    }
    await userModel.add(entity);
    res.render('vwAccount/register');
})

route.get('/profile', async function (req, res) {
    res.render('vwAccount/profile');
})

module.exports = route;