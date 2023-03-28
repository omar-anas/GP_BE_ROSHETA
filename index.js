const express = require("express");
const cors = require("cors");
const app = express();
const helmet = require('helmet');
require('dotenv').config();

//blockchain libraries
const truffle_connect = require('./connection/app.js');
const Web3 = require('web3');

//utils
const logger = require('./Utils/logger');

//secure headers
app.use(helmet());
app.use(cors());

//middleware for cookies
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//routes
app.use("/admin", require('./routes/admin.routes'));
app.use("/", require('./routes/auth.routes'));
app.use("/EHR", require('./routes/EHR.routes'));

//listen to port 5000
const port = process.env.PORT || 5000;

app.listen(port, async () => {
    try {
        // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
        truffle_connect.web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:7545"));
        logger.info('database connected .........')
        logger.info('blockchain connected .........')
        logger.info(`server running on ${port}`)

    } catch (error) {
        logger.error(error);
        process.exit(1);
    }
});
