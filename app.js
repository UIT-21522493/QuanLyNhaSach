const express = require('express');
const exphbs = require('express-handlebars');
const hbs_sections = require('express-handlebars-sections');


const app = express();

app.use(express.urlencoded({
    extended: true
}));

app.engine('hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: 'views/_layouts',
    partialsDir: 'views/_partials',
    extname: '.hbs',
    helpers: {
        section: hbs_sections()
    }
    // helper: {
    //     format_number: function(value){
    //         return numeral(value).format('0,0');
    //     }
    // }
}));
app.set('view engine', 'hbs');
//app.set("views", "views");

app.use('/public', express.static('public'));

const categoryModel = require('./models/catagory.model');
app.use(async function (req, res, next) {
    const rows = await categoryModel.allWithDetails();
    res.locals.lcCategories = rows;
    next();
})

app.get('/', function (req, res) {
    res.render('home');
})

app.get('/about', function (req, res) {
    res.render('about');
})

const categoryRouter = require('./routers/category.route');
app.use('/admin/categories', categoryRouter);

const productRouter = require('./routers/product.route');
app.use('/admin/products', productRouter);

app.use('/account', require('./routers/_account.route'));

app.use('/products', require('./routers/_product.route'));

app.get('/bs', function (req, res) {
    res.sendFile(__dirname + '/bs.html');
})

app.get('/err', function (req, res) {
    throw new Error('Lost database !!!');
})

app.use(function (req, res) {
    res.render('404', { layout: false });
})

app.use(function (err, req, res, next) {
    console.error(err.stack);
    res.status(500).send('Something broke!');
})

const PORT = 3000;
app.listen(PORT, function () {
    console.log(`Server is running at http://localhost:${PORT}`);
})