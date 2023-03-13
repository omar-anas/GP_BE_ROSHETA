const db = require('../DB/exectuemysql');
const helper = require('../DB/helper')
const config = require('../DB/mysqlconfig');
class PatientController {
    static getAllPatients = async (req,res) =>{
    try {
        let page = req.query.page;
        let limit = req.query.limit;
        let listPerPage = limit ? limit : config.listPerPage;

        const offset = helper.getOffset(page, listPerPage);
        const rows = await db.query(
            `call GET_ALL_PATIENTS(${offset},${listPerPage})`
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
        res.json({ message: "success fetched all patients", data });

    } catch (error) {
        res.json({ message: "fail", error: error.message });
        
    }
}
static getPatient = async (req,res) =>{
    try {
        
        
        const rows = await db.query(
            `call GET_PATIENT(${req.params.id})`
        );
        const data = helper.emptyOrRows(rows);
        
        res.json({ message: "success fetched  patient", data });

    } catch (error) {
        res.json({ message: "fail", error: error.message });
        
    }
}



static addPatient =async (req,res)=>{
    const patient = req.body
        try {
            
            let PATIENT_FIRST_NAME_V = patient.PATIENT_FIRST_NAME
            let PATIENT_LAST_NAME_V = patient.PATIENT_LAST_NAME
            let PATIENT_EMAIL_V = req.body.PATIENT_EMAIL
            let PATIENT_PASS_V = req.body.PATIENT_PASSWORD
            let PATIENT_PHONE_V = req.body.PATIENT_PHONE
            let PATIENT_ADDRESS_V = patient.PATIENT_ADDRESS
            let PATIENT_GENDER_V = req.body.PATIENT_GENDER
            let DOB_V = req.body.DOB
            

            
            const HASHED_PASSWORD_V =await helper.hashingPassword(PATIENT_PASS_V);

            const rows = await db.query(
                `call ADD_NEW_PATIENT('${PATIENT_FIRST_NAME_V}','${PATIENT_LAST_NAME_V}','${PATIENT_EMAIL_V}',${HASHED_PASSWORD_V},${PATIENT_PHONE_V},'${PATIENT_ADDRESS_V}','${PATIENT_GENDER_V}','${DOB_V}')`
                );
                const data = helper.emptyOrRows(rows);
                res.json({ message: "Success PATIENT IS ADDED", data });
                
            } catch (error) {
                res.json({ message: "failed Process", error: error.message });
                
            }
        }
        
        static editPatient = async (req,res)=>{
            const patient = req.body
            try {
                let PATIENT_ID_V = req.params.id
                let PATIENT_FIRST_NAME_V = patient.PATIENT_FIRST_NAME
                let PATIENT_LAST_NAME_V = patient.PATIENT_LAST_NAME
                let PATIENT_EMAIL_V = req.body.PATIENT_EMAIL
                let PATIENT_ADDRESS_V = patient.PATIENT_ADDRESS
                let PATIENT_PHONE_V = req.body.PATIENT_PHONE
                let PATIENT_GENDER_V = req.body.PATIENT_GENDER
                let DOB_V = req.body.DOB
                let PATIENT_WEIGHT_V = req.body.PATIENT_WEIGHT
                let PATIENT_HEIGHT_V = req.body.PATIENT_HEIGHT
                let PATIENT_SYMPTOM_V = req.body.PATIENT_SYMPTOM
                let PATIENT_PHOTO_V = req.body.PATIENT_PHOTO

                const rows = await db.query(
                `call EDIT_PATIENT(${PATIENT_ID_V},'${PATIENT_STATUS_V}',${PATIENT_ADMIN_ID_V},'${PATIENT_FIRST_NAME_V}','${PATIENT_LAST_NAME_V}','${PATIENT_EMAIL_V}','${PATIENT_ADDRESS_V}','${PATIENT_PHONE_V}','${PATIENT_GENDER_V}','${DOB_V}','${PATIENT_HEIGHT_V}','${PATIENT_WEIGHT_V}','${PATIENT_SYMPTOM_V}','${PATIENT_PHOTO_V}')`
                );
                const data = helper.emptyOrRows(rows);
                res.json({ message: "Success PATIENT IS MODIFIED", data });

        } catch (error) {
            res.json({ message: "failed Process", error: error.message });

        }

        }


    
    }
    
    module.exports = PatientController