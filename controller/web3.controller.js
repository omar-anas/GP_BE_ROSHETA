const { storeFile, storeWithProgress } = require('../web3/store')
const { retrieve, retrieveFiles } = require('../web3/retrieve')
const { checkStatus } = require('../web3/query')
const { listUploads, listWithLimits } = require('../web3/list')

class Web3Controller {
    static store = async (req, res) => {
        console.log({ data: req.body })

        let file = req.body.file
        console.log({ file })

        storeFile(file)
            .then(cid => {
                console.log({ cid })
                res.send({ cid })
            })
            .catch(error => res.send({ error }))
    }

    static retrieve = async (req, res) => {
        const cid = req.query.cid

        retrieve(cid)
            .then(async data => {
                // let unixData = await data.unixFsIterator().next()
                //     .then(unix => {
                //         let value = unix.value
                //         let done = unix.done

                //         let d = {
                //             type: value.type,
                //             name: value.name,
                //             path: value.path,
                //             cid: value.cid,
                //             // content: value.content.yieldDirectoryContent,
                //             // unixfs: Object(value.unixfs),
                //             depth: value.depth,
                //             // node: value.node,
                //             size: value.size,
                //             done: done
                //         }
                //         return d
                //     })
                let symbols = Object.getOwnPropertySymbols(data)
                let bodyInternals = data[symbols[0]]
                let responseInternals = data[symbols[1]]
                let files = await data.files()
                let size = data.size

                res.send({
                    bodyInternals,
                    responseInternals,
                    files,
                    // unixData,
                    size
                })
            })
            .catch(error => {
                console.error(error)
                res.send({ error: error.message })
            })
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
