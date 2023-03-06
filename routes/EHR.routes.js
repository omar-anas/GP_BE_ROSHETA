const router = require("express").Router();
const blockchainController = require('../controller/blockchain.controler');

router.get('/getAccounts', blockchainController.getAccounts());
  
  router.post('/getBalance', (req, res) => {
    console.log("**** GET /getBalance ****");
    console.log(req.body);
    let currentAcount = req.body.account;
  
    truffle_connect.refreshBalance(currentAcount, (answer) => {
      let account_balance = answer;
      truffle_connect.start(function(answer){
        // get list of all accounts and send it along with the response
        let all_accounts = answer;
        response = [account_balance, all_accounts]
        res.send(response);
      });
    });
  });
  
  router.post('/sendCoin', (req, res) => {
    console.log("**** GET /sendCoin ****");
    console.log(req.body);
  
    let amount = req.body.amount;
    let sender = req.body.sender;
    let receiver = req.body.receiver;
  
    truffle_connect.sendCoin(amount, sender, receiver, (balance) => {
      res.send(balance);
    });
  });

  
module.exports = router;