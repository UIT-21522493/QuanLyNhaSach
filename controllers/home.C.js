const express = require('express'),
    router = express.Router();
    
router.use('/home', require('./mainPage.C'));

router.get('/', (req, res) => {
    res.render('home');
});

router.use('/bookLookUp', require('./bookLookUp.C'));

module.exports = router;