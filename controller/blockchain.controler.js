const Web3 = require('web3');

const truffle_connect = require('../connection/app.js');

class blockchainController {
  //  Patient Functions
  static addPatient = (req, res) => {
    console.log("**** POST /addPatient ****");

    let sender = req.body.sender;
    let patientId = req.body.patientId;
    console.log({ sender, patientId });

    truffle_connect.addPatient(sender, patientId, function (isAdded) {
      res.send({ isAdded });
    })
  }

  static getPatient = (req, res) => {
    console.log("**** GET /getPatient ****");

    let sender = req.query.sender;
    let patientId = req.query.patientId;
    console.log({ sender, patientId });

    truffle_connect.getPatient(sender, patientId, function (patient) {
      res.send({ patient });
    })
  }

  //  Doctor Functions
  static addDoctor = (req, res) => {
    console.log("**** POST /addDoctor ****");

    let doctorId = req.body.doctorId;
    console.log({ doctorId });

    truffle_connect.addDoctor(doctorId, function (doctor) {
      res.send({ doctor });
    })
  }

  static getDoctor = (req, res) => {
    console.log("**** GET /getDoctor ****");

    let doctorId = req.query.doctorId;
    console.log({ doctorId });

    truffle_connect.getDoctor(doctorId, function (doctor) {
      res.send({ doctor });
    })
  }

  //  Record Functions
  static addRecord = (req, res) => {
    console.log("**** POST /addRecord ****");
    let { sender, cid, fileName, patientId } = req.body

    console.log({ sender, cid, fileName, patientId });

    truffle_connect.addRecord(sender, cid, fileName, patientId, function (records) {
      res.send({ records });
    })
  }

  static getRecords = (req, res) => {
    console.log("**** GET /getRecords ****");
    let sender = req.query.sender
    let patientId = req.query.patientId

    console.log({ sender, patientId });

    truffle_connect.getRecords(sender, patientId, function (records) {
      res.send({ records });
    })
  }

  //  Utils
  static getAccounts = (req, res) => {
    console.log("**** GET /getAccounts ****");

    truffle_connect.getAccounts(function (accounts) {
      console.log({ accounts })
      res.send({ accounts });
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