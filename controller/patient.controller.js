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
            let PATIENT_ADMIN_ID_V = patient.ADMIN_ID
            let PATIENT_CLINC_ID_V = patient.CLINC_ID
            let PATIENT_FIRST_NAME_V = patient.PATIENT_FIRST_NAME
            let PATIENT_LAST_NAME_V = patient.PATIENT_LAST_NAME
            let PATIENT_EMAIL_V = req.body.PATIENT_EMAIL
            let ADDRESS_V = patient.ADDRESS
            let GENDER_V = req.body.GENDER
            let DOB_V = req.body.DOB
            let SPECIALIZATION_V = req.body.SPECIALIZATION
            let PHONE_V = req.body.PHONE

            const rows = await db.query(
                `call ADD_NEW_PATIENT(${PATIENT_ADMIN_ID_V},${PATIENT_CLINC_ID_V},'${PATIENT_FIRST_NAME_V}','${PATIENT_LAST_NAME_V}','${PATIENT_EMAIL_V}','${ADDRESS_V}','${GENDER_V}','${DOB_V}','${SPECIALIZATION_V}','${PHONE_V}')`
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
                let PATIENT_STATUS_V = patient.STATUS
                let PATIENT_ADMIN_ID_V = patient.ADMIN_ID
                let PATIENT_CLINC_ID_V = patient.CLINC_ID
                let PATIENT_FIRST_NAME_V = patient.PATIENT_FIRST_NAME
                let PATIENT_LAST_NAME_V = patient.PATIENT_LAST_NAME
                let PATIENT_EMAIL_V = req.body.PATIENT_EMAIL
                let ADDRESS_V = patient.ADDRESS
                let GENDER_V = req.body.GENDER
                let DOB_V = req.body.DOB
                let SPECIALIZATION_V = req.body.SPECIALIZATION
                let PHONE_V = req.body.PHONE

                const rows = await db.query(
                `call EDIT_PATIENT(${PATIENT_ID_V},'${PATIENT_STATUS_V}',${PATIENT_ADMIN_ID_V},${PATIENT_CLINC_ID_V},'${PATIENT_FIRST_NAME_V}','${PATIENT_LAST_NAME_V}','${PATIENT_EMAIL_V}','${ADDRESS_V}','${GENDER_V}','${DOB_V}','${SPECIALIZATION_V}','${PHONE_V}')`
                );
                const data = helper.emptyOrRows(rows);
                res.json({ message: "Success PATIENT IS MODIFIED", data });

        } catch (error) {
            res.json({ message: "failed Process", error: error.message });

        }

        }


    static PatientLogin =(req,res)=>{
        res.json({data:req.body , type:"Patient"})
    }
    }
    
    module.exports = PatientController