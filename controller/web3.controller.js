const fs = require('fs')
const path = require('path')

const { storeFile, storeWithProgress } = require('../web3/store')
const { retrieve, retrieveFiles } = require('../web3/retrieve')
const { checkStatus } = require('../web3/query')
const { listUploads, listWithLimits } = require('../web3/list')

class Web3Controller {
    static store = async (req, res) => {
        const file = req.body.file

        storeFile(file)
            .then(cid => {
                res.send({ cid })
            })
            .catch(error => res.send({ error }))
    }

    static retrieve = async (req, res) => {
        const cid = req.query.cid

        retrieve(cid)
            .then(data => {
                console.log(data)
                res.send({ data })
            })
            .catch(error => res.send({ error }))
    }

    static query = async (req, res) => {

    }

    static list = async (req, res) => {

    }
}

module.exports = Web3Controller
