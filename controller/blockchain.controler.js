const Web3 = require('web3');
const truffle_connect = require('../connection/app.js');



class blockchainController {

        static getAccounts = (req, res) => {
            console.log("DDDDDDDDDDDDDDDDDDDD")
        console.log("**** GET /getAccounts ****");
        
        truffle_connect.start(function (answer) {
          res.send(answer);
        })
      }
      
      static getBalance = (req, res) => {
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
      }
      
      
      

}

module.exports = blockchainController