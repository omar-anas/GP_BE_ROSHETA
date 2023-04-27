const router = require("express").Router();
const Web3Controller = require('../controller/web3.controller.js')

//  Web3 Routes
router.post('/store', Web3Controller.store);
router.get('/retrieve', Web3Controller.retrieve);
router.get('/query', Web3Controller.query);
router.get('/list', Web3Controller.list);

module.exports = router;