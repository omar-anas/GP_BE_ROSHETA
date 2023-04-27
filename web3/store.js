const Web3Storage = require('web3.storage').Web3Storage
const getFilesFromPath = require('web3.storage').getFilesFromPath
const Web3File = require('web3.storage').File

require("dotenv").config()

const makeStorageClient = () => new Web3Storage({ token: process.env.WEB3STORAGE_TOKEN })

async function storeFile(file) {
    const client = makeStorageClient()

    const cid = await client.put(file)

    console.log('stored file with cid:', cid)

    return cid
}

async function storeWithProgress(file) {
    // show the root cid as soon as it's ready
    const onRootCidReady = cid => {
        console.log('uploading file with cid:', cid)
    }

    // when each chunk is stored, update the percentage complete and display
    const totalSize = file.map(f => f.size).reduce((a, b) => a + b, 0)
    let uploaded = 0

    const onStoredChunk = size => {
        uploaded += size
        const pct = 100 * (uploaded / totalSize)
        console.log(`Uploading... ${pct.toFixed(2)}% complete`)
    }

    // makeStorageClient returns an authorized web3.storage client instance
    const client = makeStorageClient()

    // client.put will invoke our callbacks during the upload
    // and return the root cid when the upload completes
    return client.put(file, { onRootCidReady, onStoredChunk })
}

module.exports = {
    storeFile,
    storeWithProgress
}
