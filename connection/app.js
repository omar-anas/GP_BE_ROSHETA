const Web3 = require('web3')
const provider = new Web3.providers.HttpProvider("http://127.0.0.1:7545")
const web3 = new Web3(provider)

const { contractABI, contractAddress } = require('../Utils/constants')
const EHR = new web3.eth.Contract(contractABI, contractAddress)

module.exports = {
    //  Patient Functions
    addPatient: async function (sender, patientId, callback) {
        var self = this

        EHR.methods.addPatient(patientId).send({ from: sender })
        .on('receipt', function (receipt) {
            callback({ receipt })
        })
        .on('confirmation', function (confirmationNumber, receipt) {
            callback({ confirmationNumber, receipt })
        })
        .on('error', function (error, receipt) {
            callback({ error, receipt })
        })
        // .then(() => {
        //     self.getPatientExists(sender, patientId, callback)
        // })
        // .catch(function (e) {
        //     console.log(e)
        //     callback("ERROR 404")
        // })
    },

    getPatient: async function (sender, patientId, callback) {
        EHR.methods.getPatient(patientId).send({ from: sender })
            .then(patient => {
                callback(patient)
            })
            .catch(function (e) {
                console.log(e)
                callback("ERROR 404")
            })
    },

    getPatientExists: async function (sender, patientId, callback) {
        EHR.methods.getPatientExists(patientId).send({ from: sender })
            .then(function (value) {
                callback(value)
            })
            .catch(function (e) {
                console.log(e)
                callback("ERROR 404")
            })
    },

    //  Doctor Functions
    addDoctor: async function (sender, callback) {
        var self = this

        EHR.methods.addDoctor().send({ from: sender })
            .then(() => {
                self.getDoctor(sender, callback)
            })
            .catch(function (e) {
                console.log(e)
                callback("ERROR 404")
            })
    },

    getDoctor: async function (sender, callback) {
        EHR.methods.getDoctor(sender).send({ from: sender })
            .then(doctor => {
                callback(doctor)
            })
            .catch(function (e) {
                console.log(e)
                callback("ERROR 404")
            })
    },

    //  Record Functions
    addRecord: async function (sender, cid, fileName, patientId, callback) {
        var self = this

        EHR.methods.addRecord(cid, fileName, patientId).send({ from: sender })
            .then(function () {
                self.getRecords(sender, patientId, function (answer) {
                    callback(answer)
                })
            })
            .catch(function (e) {
                console.log(e)
                callback("ERROR 404")
            })
    },

    getRecords: async function (sender, patientId, callback) {
        EHR.methods.getRecords(patientId).send({ from: sender })
            .then(function (records) {
                callback(records)
            })
            .catch(function (e) {
                console.log(e)
                callback("ERROR 404")
            })
    },

    //  Utils
    getAccounts: async function (callback) {
        var self = this

        web3.eth.getAccounts(function (err, accounts) {
            if (err != null) {
                console.log("There was an error fetching your accounts.")
                return
            }

            if (accounts.length == 0) {
                console.log("Couldn't get any accounts! Make sure your Ethereum client is configured correctly.")
                return
            }

            callback(accounts)
        })
    },

    getSenderRole: async function (sender, callback) {
        EHR.methods.getSenderRole().send({ from: sender })
            .then(function (value) {
                callback(value)
            })
            .catch(function (e) {
                console.log(e)
                callback("ERROR 404")
            })
    },
}
