const Web3 = require('web3');

const truffle_connect = require('../connection/app.js');

class blockchainController {

  static getAccounts = (req, res) => {
    console.log("**** GET /getAccounts ****");

    truffle_connect.start(function (answer) {
      console.log(answer)
      res.send(answer);
    })
  }

  static addDoctor = (req, res) => {
    console.log("**** POST /addDoctor ****");

    let doctorId = req.body.doctorId;
    console.log({ doctorId });

    truffle_connect.addDoctor(doctorId, function (address) {
      res.send(address);
    })
  }

  static addPatient = (req, res) => {
    console.log("**** POST /addPatient ****");

    let sender = req.body.sender;
    let patientId = req.body.patientId;
    console.log({ sender, patientId });

    truffle_connect.addPatient(sender, patientId, function (isAdded) {
      res.send({ isAdded });
    })
  }

  static addRecord = (req, res) => {
    console.log("**** POST /addRecord ****");
    let { sender, cid, fileName, patientId } = req.body

    console.log({ sender, cid, fileName, patientId });

    truffle_connect.addRecord(sender, cid, fileName, patientId, function (records) {
      res.send({records});
    })
  }

  static getRecords = (req, res) => {
    console.log("**** GET /getRecords ****");
    let sender = req.body.sender
    let patientId = req.body.patientId

    console.log({ sender, patientId });

    truffle_connect.getRecords(sender, patientId, function (records) {
      res.send(records);
    })
  }

  static getSenderRole = (req, res) => {
    console.log("**** GET /getSenderRole ****");
    let sender = req.params.id

    console.log({ sender });

    truffle_connect.getSenderRole(sender, function (role) {
      console.log({ role });
      res.send({ role });
    })
  }

}

module.exports = blockchainController