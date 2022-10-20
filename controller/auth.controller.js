const jwt = require('jsonwebtoken');
const helper = require('../DB/helper')
const db = require('../DB/exectuemysql');
require('dotenv');

class authController {

    static login_Handler = (req, res) => {
        const myRe = /(@Rosheta.com)/g;
        const flag = myRe.test(req.body.EMAIL);
        let userType

        if (flag) {
            authController.dotcorLogin(req, res);
        } else {
            authController.PatientLogin(req, res);
        }

    }


    static AdminLogin = async (req, res) => {
        try {
            let Admin_Email_V = req.body.EMAIL;
            let Admin_PASS_V = req.body.PASSWORD;
            let accessToken
            const HASHED_PASSWORD_V = await helper.hashingPassword(Admin_PASS_V);
            
            const rows = await db.query(
                `call LOGIN_ADMIN('${Admin_Email_V}',${HASHED_PASSWORD_V})`
                )
                
                
                const data = helper.emptyOrRows(rows);

            if (data[0][0]['count(ID)']) {
                accessToken = jwt.sign({ Admin_Email_V, role: "ADMIN" }, process.env.ACCESS_TOKEN_SECRET)

            } else {
                throw new Error("wrong email or password")
            }
            res.json({ accessToken, message: "sucessfull authentication" })

        } catch (error) {
            res.json({ message: "failed Process", error: error.message });
        }
    }


    static dotcorLogin = async (req, res) => {
        try {
            let Doctor_Email_V = req.body.EMAIL;
            let DOCTOR_PASS_V = req.body.PASSWORD;
            let accessToken
            const HASHED_PASSWORD_V = await helper.hashingPassword(DOCTOR_PASS_V);

            const rows = await db.query(
                `call LOGIN_DOCTOR('${Doctor_Email_V}',${HASHED_PASSWORD_V})`
            )


            const data = helper.emptyOrRows(rows);

            if (data[0][0]['count(ID)']) {
                accessToken = jwt.sign({ Doctor_Email_V, role: "Dotcor" }, process.env.ACCESS_TOKEN_SECRET)

            } else {
                throw new Error("wrong email or password")
            }
            res.json({ accessToken, message: "sucessfull authentication" })

        } catch (error) {
            res.json({ message: "failed Process", error: error.message });
        }
    }


    static PatientLogin = (req, res) => {
        res.json({ data: req.body, type: "Patient" })
    }


}

module.exports = authController