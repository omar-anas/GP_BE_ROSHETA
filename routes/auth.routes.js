const router = require("express").Router();
const authController = require('../controller/auth.controller');

router.post('/login',authController.login_Handler);
module.exports = router;