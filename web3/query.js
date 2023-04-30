const Web3Storage = require('web3.storage').Web3Storage

const makeStorageClient = () => new Web3Storage({ token: process.env.WEB3STORAGE_TOKEN })

async function checkStatus(cid) {
    const client = makeStorageClient()

    let status = await client.status(cid)

    console.log({ status })
    if (status) {
        return status
    }
}

module.exports = {
    checkStatus
}