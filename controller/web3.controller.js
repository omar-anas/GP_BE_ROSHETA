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
            .then(async data => {
                let sss
                await data.unixFsIterator().next().then(console.log)

                let symbols = Object.getOwnPropertySymbols(data)
                let bodyInternals = data[symbols[0]]
                let responseInternals = data[symbols[1]]
                let files = await data.files()
                let unixFsIterator = await data.unixFsIterator().next().then(res => res)
                let size = data.size

                console.log({ bodyInternals })
                console.log({ responseInternals })
                console.log({ files })
                console.log({ unixFsIterator })
                console.log({ size })

                res.send({
                    bodyInternals,
                    responseInternals,
                    files,
                    unixFsIterator,
                    size
                })
            })
            .catch(error => res.send({ error }))
    }

    static query = async (req, res) => {
        const cid = req.query.cid

        checkStatus(cid)
            .then(status => {
                console.log({ status })
                res.send({ status })
            })
            .catch(err => res.send({ err }))
    }

    static list = async (req, res) => {
        listUploads()
            .then(asyncData => {
                asyncData.next()
                    .then(data => res.send({ data }))
            })
            .catch(err => res.send({ err }))
    }
}

module.exports = Web3Controller
