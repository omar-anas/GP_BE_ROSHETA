const express = require("express");
const cors = require("cors");
const app = express();
const helmet = require('helmet');
require('dotenv').config();

//utils
const logger = require('./Utils/logger');


//secure headers
app.use(helmet());


app.use(cors());



//middleware for cookies
app.use(express.json());
app.use(express.urlencoded({extended:true}));







//routes
app.use("/admin",require('./routes/admin.routes'));
app.use("/",require('./routes/auth.routes'));




//listen to port 5000
const port = process.env.PORT || 5000;


app.listen(port, async () => {
    try {
        logger.info('DB Connected .........')
        logger.info(`server running on ${port}`)
    } catch (error) {
        logger.error(error);
        process.exit(1);
    }
});
