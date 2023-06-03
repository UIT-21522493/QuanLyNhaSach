const express = require('express'),
    router = express.Router();
    
 router.get('/', (req, res) => {
        res.redirect('login');
    });

router.use('/login', require('./login/login.C'));
router.use('/forgotPass', require('./login/forgotPass.C'));
router.use('/changePass', require('./login/changePass.C'));

router.use('/home', require('./mainPage.C'));

router.use('/bookLookUp', require('./bookLookUp.C'));

module.exports = router;