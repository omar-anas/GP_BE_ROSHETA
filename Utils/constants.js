try {
    const EHR_contract = require("../build/contracts/EHR.json")

    module.exports = {
        contractABI: EHR_contract.abi,
        contractAddress: "0x68a92D7a40682221Fe0edf0528933814B25f68c6"
    }
} catch (err) {
    console.log("\x1b[31m", '\nEHR contract not deployed to detected network.\n')
    console.info("\x1b[36m", 'run "truffle deploy" to deploy the smart contracts\n\n', "\x1b[0m")
}