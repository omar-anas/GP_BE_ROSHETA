const router = require("express").Router();
const blockchainController = require('../controller/blockchain.controler');

//  Patient Routes
router.post('/addPatient', blockchainController.addPatient);
router.get('/getPatient', blockchainController.getPatient);

//  Doctor Routes
router.post('/addDoctor', blockchainController.addDoctor);
router.get('/getDoctor', blockchainController.getDoctor);

//  Record Routes
router.post('/addRecord', blockchainController.addRecord);
router.get('/getRecords', blockchainController.getRecords);

//  Utils Routes
router.get('/accounts', blockchainController.getAccounts);
router.get('/role/:id', blockchainController.getSenderRole);

module.exports = router;