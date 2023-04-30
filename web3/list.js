const Web3Storage = require('web3.storage').Web3Storage

const makeStorageClient = () => new Web3Storage({ token: process.env.WEB3STORAGE_TOKEN })

async function listUploads() {
    const client = makeStorageClient()

    for await (const upload of client.list()) {
        console.log(`${upload.createdname} - cid: ${upload.cid} - size: ${upload.dagSize}`)
    }

    console.log(client.list())

    return client.list()
}

async function listWithLimits() {
    const client = makeStorageClient()

    // get today's date and subtract 1 day
    const d = new Date()
    d.setDate(d.getDate() - 1)

    // the list method's before parameter accepts an ISO formatted string
    const before = d.toISOString()

    // limit to ten results
    const maxResults = 10

    for await (const upload of client.list({ before, maxResults })) {
        console.log(upload)
    }
}

module.exports = {
    listUploads,
    listWithLimits
}