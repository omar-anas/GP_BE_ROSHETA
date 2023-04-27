const Web3Storage = require('web3.storage').Web3Storage

const makeStorageClient = () => new Web3Storage({ token: process.env.WEB3STORAGE_TOKEN })

async function retrieve(cid) {
  const client = makeStorageClient()

  let res = await client.get(cid)
  console.log(`Got a response! [${res.status}] ${res.statusText}`)

  if (!res.ok)
    throw new Error(`failed to get ${cid}`)

  return res
}

async function retrieveFiles(cid) {
  const client = makeStorageClient()

  const res = await client.get(cid)
  console.log(`Got a response! [${res.status}] ${res.statusText}`)

  if (!res.ok)
    throw new Error(`failed to get ${cid} - [${res.status}] ${res.statusText}`)

  // unpack File objects from the response
  const files = await res.files()
  for (const file of files) {
    console.log(`${file.cid} -- ${file.path} -- ${file.size}`)
    console.log({ file })
  }
}

module.exports = {
  retrieve,
  retrieveFiles
}
