const db = require('../DB/exectuemysql');
const helper = require('../DB/helper')
const config = require('../DB/mysqlconfig');

require('dotenv');
class DoctorController {

static getAllDoctors = async (req,res) =>{
    try {
        let page = req.query.page;
        let limit = req.query.limit;
        let listPerPage = limit ? limit : config.listPerPage;

        const offset = helper.getOffset(page, listPerPage);
        const rows = await db.query(
            `call GET_ALL_DOCTORS(${offset},${listPerPage})`
        );
        const data = helper.emptyOrRows(rows);
        const totalNumber = (data[0][0]?data[0][0]['number_of_rows']:0);
        const count = (totalNumber) - offset > listPerPage ? listPerPage: (totalNumber) - offset > 0 ? (totalNumber) - offset :0   ;
        data[1]['offset']=offset;
        data[1]['page']=page;
        data[1]['count']= count;
        data[1]['totalNumber']= totalNumber;
        data[1]['limit']=listPerPage;
        const hasmore = data != []?  helper.hasmore(listPerPage,count) : false
        data[1]['hasmore']=hasmore;
        res.json({ message: "success fetched all doctors", data });

    } catch (error) {
        res.json({ message: "fail", error: error.message });
        
    }
}
static getDoctor = async (req,res) =>{
    try {
        
        
        const rows = await db.query(
            `call GET_DOCTOR(${req.params.id})`
        );
        const data = helper.emptyOrRows(rows);
       
        res.json({ message: "success fetched  doctor", data });

    } catch (error) {
        res.json({ message: "fail", error: error.message });
        
    }
}


static addDoctor =async (req,res)=>{
    const doctor = req.body
        try {
            let DOCTOR_ADMIN_ID_V = doctor.ADMIN_ID
            let DOCTOR_CLINC_ID_V = doctor.CLINC_ID
            let DOCTOR_FIRST_NAME_V = doctor.DOCTOR_FIRST_NAME
            let DOCTOR_LAST_NAME_V = doctor.DOCTOR_LAST_NAME
            let DOCTOR_EMAIL_V = doctor.DOCTOR_EMAIL ? doctor.DOCTOR_EMAIL :null
            let DOCTOR_PASS_V = req.body.DOCTOR_PASSWORD
            let ADDRESS_V = doctor.ADDRESS
            let GENDER_V = req.body.GENDER
            let DOB_V = req.body.DOB
            let SPECIALIZATION_V = req.body.SPECIALIZATION
            let PHONE_V = req.body.PHONE

            if(!DOCTOR_EMAIL_V){
                DOCTOR_EMAIL_V = helper.doctorEmailGenerator(DOCTOR_FIRST_NAME_V, DOCTOR_LAST_NAME_V);
            }
            const HASHED_PASSWORD_V =await helper.hashingPassword(DOCTOR_PASS_V);
            const rows = await db.query(
                `call ADD_NEW_DOCTOR(${DOCTOR_ADMIN_ID_V},${DOCTOR_CLINC_ID_V},'${DOCTOR_FIRST_NAME_V}','${DOCTOR_LAST_NAME_V}','${DOCTOR_EMAIL_V}',${HASHED_PASSWORD_V},'${ADDRESS_V}','${GENDER_V}','${DOB_V}','${SPECIALIZATION_V}','${PHONE_V}')`
                );
                const data = helper.emptyOrRows(rows);
                res.json({ message: "Success DOCTOR IS ADDED", data });
                
            } catch (error) {
                res.json({ message: "failed Process", error: error.message });
                
            }
        }
        
        static editDoctor = async (req,res)=>{
            const doctor = req.body
            try {
                let DOCTOR_ID_V = req.params.id
                let DOCTOR_STATUS_V = doctor.STATUS
                let DOCTOR_ADMIN_ID_V = doctor.ADMIN_ID
                let DOCTOR_CLINC_ID_V = doctor.CLINC_ID
                let DOCTOR_FIRST_NAME_V = doctor.DOCTOR_FIRST_NAME
                let DOCTOR_LAST_NAME_V = doctor.DOCTOR_LAST_NAME
                let DOCTOR_EMAIL_V = req.body.DOCTOR_EMAIL
                let DOCTOR_PASS_V = req.body.DOCTOR_PASSWORD
                let ADDRESS_V = doctor.ADDRESS
                let GENDER_V = req.body.GENDER
                let DOB_V = req.body.DOB
                let SPECIALIZATION_V = req.body.SPECIALIZATION
                let PHONE_V = req.body.PHONE

                const HASHED_PASSWORD_V =await helper.hashingPassword(DOCTOR_PASS_V);
                

                const rows = await db.query(
                `call EDIT_DOCTOR(${DOCTOR_ID_V},'${DOCTOR_STATUS_V}',${DOCTOR_ADMIN_ID_V},${DOCTOR_CLINC_ID_V},'${DOCTOR_FIRST_NAME_V}','${DOCTOR_LAST_NAME_V}','${DOCTOR_EMAIL_V}',${HASHED_PASSWORD_V},'${ADDRESS_V}','${GENDER_V}','${DOB_V}','${SPECIALIZATION_V}','${PHONE_V}')`
                );
                const data = helper.emptyOrRows(rows);
                res.json({ message: "Success DOCTOR IS MODIFIED", data });

        } catch (error) {
            res.json({ message: "failed Process", error: error.message });

        }
}




}

module.exports = DoctorController