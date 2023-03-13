const router = require("express").Router();
const blockchainController = require('../controller/blockchain.controler');

router.get('/accounts', blockchainController.getAccounts);
router.get('/getSenderRole/:id', blockchainController.getSenderRole);

router.post('/addPatient', blockchainController.addPatient);
router.post('/addDoctor', blockchainController.addDoctor);
router.post('/addRecord', blockchainController.addRecord);
router.post('/getRecords', blockchainController.getRecords);

module.exports = router;