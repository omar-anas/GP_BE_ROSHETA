const jwt = require('jsonwebtoken');
const helper = require('../DB/helper')
const db = require('../DB/exectuemysql');
require('dotenv');

class authController {

    static login_Handler = (req, res) => {
        const myRe = /(@mobicare.com)/g;
        const flag = myRe.test(req.body.EMAIL);

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
            let refreshToken
            const HASHED_PASSWORD_V = await helper.hashingPassword(Admin_PASS_V);

            const rows = await db.query(
                `call LOGIN_ADMIN('${Admin_Email_V}',${HASHED_PASSWORD_V})`
            )

            let data = helper.emptyOrRows(rows);
            data = data[0][0];
            if (data) {
                accessToken = await helper.generateAccessToken({ ID: data.ID, Admin_Email_V, role: "ADMIN" });
                refreshToken = await jwt.sign({ ID: data.ID, Admin_Email_V, role: "ADMIN" }, process.env.REFRESH_TOKEN_SECRET);

                const result = await db.query(
                    `call UPDATE_ADMIN_REFRESHTOKEN(${data.ID},'${refreshToken}')`
                )

            } else {
                throw new Error("wrong email or password")
            }
            res.json({ accessToken, refreshToken, message: "sucessfull authentication" })

        } catch (error) {
            res.json({ message: "failed Process", error: error.message });
        }
    }

    static refrshAccessToken = async (req, res) => {
        try {
            let result
            const TOKEN = req.body.token
            if (!TOKEN) {
                throw new Error("REFRESH TOKEN MISSING")
            }
            const decoded = jwt.verify(TOKEN, process.env.REFRESH_TOKEN_SECRET);

            result = await db.query(
                `call GET_${decoded.role}_REFRESHTOKEN(${decoded.ID})`
            );

            const Refresh_Token_Value = result[0][0]['Refresh_Token_Value'];

            if (Refresh_Token_Value != TOKEN) {
                throw new Error("REFRESH TOKEN IS NOT VALID");
            }

            const accesstoken = await helper.generateAccessToken({ ID: decoded.ID, Admin_Email_V: decoded.Admin_Email_V, role: decoded.role });
            res.json({ accesstoken, message: "successful authentication" })

        } catch (error) {
            res.json({ message: "failed Process", error: error.message });
        }
    }

    static dotcorLogin = async (req, res) => {
        try {
            let Doctor_Email_V = req.body.EMAIL;
            let DOCTOR_PASS_V = req.body.PASSWORD;
            let accessToken
            let refreshToken
            const HASHED_PASSWORD_V = await helper.hashingPassword(DOCTOR_PASS_V);

            const rows = await db.query(
                `call LOGIN_DOCTOR('${Doctor_Email_V}',${HASHED_PASSWORD_V})`
            )

            let data = helper.emptyOrRows(rows);
            data = data[0][0];

            if (data) {
                accessToken = await helper.generateAccessToken({ ID: data.ID, Doctor_Email_V, role: "DOCTOR" });
                refreshToken = await jwt.sign({ ID: data.ID, Doctor_Email_V, role: "DOCTOR" }, process.env.REFRESH_TOKEN_SECRET);

                const result = await db.query(
                    `call UPDATE_DOCTOR_REFRESHTOKEN(${data.ID},'${refreshToken}')`
                )

            } else {
                throw new Error("wrong email or password")
            }
            res.json({ accessToken, refreshToken, message: "sucessfull authentication" })

        } catch (error) {
            res.json({ message: "failed Process", error: error.message });
        }
    }

    static PatientLogin = async (req, res) => {
        try {
            let Patient_Email_V = req.body.EMAIL;
            let Patient_PASS_V = req.body.PASSWORD;
            let accessToken
            let refreshToken

            const HASHED_PASSWORD_V = await helper.hashingPassword(Patient_PASS_V);

            const rows = await db.query(
                `call LOGIN_PATIENT('${Patient_Email_V}',${HASHED_PASSWORD_V})`
            )

            let data = helper.emptyOrRows(rows);
            data = data[0][0];

            if (data) {
                accessToken = await helper.generateAccessToken({ ID: data.ID, Patient_Email_V, role: "PATIENT" });
                refreshToken = await jwt.sign({ ID: data.ID, Patient_Email_V, role: "PATIENT" }, process.env.REFRESH_TOKEN_SECRET);

                const result = await db.query(
                    `call UPDATE_PATIENT_REFRESHTOKEN(${data.ID},'${refreshToken}')`
                )

            } else {
                throw new Error("wrong email or password")
            }
            res.json({ accessToken, refreshToken, message: "sucessfull authentication" })

        } catch (error) {
            res.json({ message: "failed Process", error: error.message });
        }
    }
}

module.exports = authController