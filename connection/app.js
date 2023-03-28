const contract = require('truffle-contract');

const EHR_artifact = require('../build/contracts/EHR.json');
var EHR = contract(EHR_artifact);


module.exports = {
    start: function (callback) {
        var self = this;

        // Bootstrap the EHR abstraction for Use.
        EHR.setProvider(self.web3.currentProvider);

        // Get the initial account balance so it can be displayed.
        self.web3.eth.getAccounts(function (err, accs) {
            if (err != null) {
                console.log("There was an error fetching your accounts.");
                return;
            }

            if (accs.length == 0) {
                console.log("Couldn't get any accounts! Make sure your Ethereum client is configured correctly.");
                return;
            }
            self.accounts = accs;

            callback(self.accounts);
        });
    },

    addPatient: function (sender, patientId, callback) {
        var self = this;

        // Bootstrap the EHR abstraction for Use.
        EHR.setProvider(self.web3.currentProvider);

        var meta;
        EHR.deployed()
            .then(function (instance) {
                meta = instance;
                return meta.addPatient(patientId, { from: sender });
            })
            .then(function () {
                self.getPatientExists(sender, patientId, function (answer) {
                    callback(answer);
                });
            })
            .catch(function (e) {
                console.log(e);
                callback("ERROR 404");
            })
    },

    addDoctor: function (sender, callback) {
        var self = this;

        // Bootstrap the EHR abstraction for Use.
        EHR.setProvider(self.web3.currentProvider);

        var meta;
        EHR.deployed()
            .then(function (instance) {
                meta = instance;
                return meta.addDoctor({ from: sender });
            })
            .then(address => {
                callback(address)
            })
            .catch(function (e) {
                console.log(e);
                callback("ERROR 404");
            })
    },

    addRecord: function (sender, cid, fileName, patientId, callback) {
        var self = this;

        // Bootstrap the EHR abstraction for Use.
        EHR.setProvider(self.web3.currentProvider);

        var meta;
        EHR.deployed()
            .then(function (instance) {
                meta = instance;
                return meta.addRecord(cid, fileName, patientId, { from: sender });
            })
            .then(function () {
                self.getRecords(sender, patientId, function (answer) {
                    callback(answer);
                });
            })
            .catch(function (e) {
                console.log(e);
                callback("ERROR 404");
            })
    },

    getRecords: function (sender, patientId, callback) {
        var self = this;

        // Bootstrap the EHR abstraction for Use.
        EHR.setProvider(self.web3.currentProvider);

        var meta;
        EHR.deployed()
            .then(function (instance) {
                meta = instance;
                self.web3.eth.getBlock(8, true)
                    .then(res => self.web3.eth.getTransactionReceipt(res.transactions[0].hash)
                        .then(console.log));

                self.web3.eth.getBlock(8, true)
                    .then(res => self.web3.eth.getTransactionReceipt(res.transactions[0].hash)
                        .then(data => console.log(
                            self.web3.utils.isHex(data.transactionHash)
                                ? self.web3.utils.BN(
                                    '0x00000000000000000000000000000000000000000000000000000000000000600000000000000000000000006276d3bfeaf90abfda5fa22c1578615e0687e94b000000000000000000000000f979c6a2451a6e483b51b9395cdfe9e8fc518d4100000000000000000000000000000000000000000000000000000000000000033173740000000000000000000000000000000000000000000000000000000000'
                                )
                                : data.transactionHash
                        ))
                    );

                return self.web3.eth.getBlock(8, true)
                    .then(res => self.web3.eth.getTransactionReceipt(res.transactions[0].hash)
                        .then(data => self.web3.utils.isHex(data.transactionHash)
                            ? self.web3.utils.BN(
                                '0x00000000000000000000000000000000000000000000000000000000000000600000000000000000000000006276d3bfeaf90abfda5fa22c1578615e0687e94b000000000000000000000000f979c6a2451a6e483b51b9395cdfe9e8fc518d4100000000000000000000000000000000000000000000000000000000000000033173740000000000000000000000000000000000000000000000000000000000'
                            )
                            : data.transactionHash)
                    );
            })
            .then(function (value) {
                callback(value);
            })
            .catch(function (e) {
                console.log(e);
                callback("ERROR 404");
            })
    },

    getSenderRole: function (sender, callback) {
        var self = this;

        // Bootstrap the EHR abstraction for Use.
        EHR.setProvider(self.web3.currentProvider);

        var meta;
        EHR.deployed()
            .then(function (instance) {
                meta = instance;
                return meta.getSenderRole({ from: sender });
            })
            .then(function (value) {
                callback(value);
            })
            .catch(function (e) {
                console.log(e);
                callback("ERROR 404");
            })
    },

    getPatientExists: function (sender, patientId, callback) {
        var self = this;

        // Bootstrap the EHR abstraction for Use.
        EHR.setProvider(self.web3.currentProvider);

        var meta;
        EHR.deployed()
            .then(function (instance) {
                meta = instance;
                return meta.getPatientExists(patientId, { from: sender });
            })
            .then(function (value) {
                callback(value);
            })
            .catch(function (e) {
                console.log(e);
                callback("ERROR 404");
            })
    },

}
