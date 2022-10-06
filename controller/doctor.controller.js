const db = require('../DB/exectuemysql');
class DoctorController {

static getAllDoctors = (req,res) =>{
    res.send("doctors");
}

static addDoctor =async (req,res)=>{
    const doctor = req.body

        try {
            let DOCTOR_ADMIN_ID = doctor.ADMIN_ID
            let DOCTOR_CLINC_ID = doctor.CLINC_ID
            let DOCTOR_FIRST_NAME_V = doctor.DOCTOR_FIRST_NAME
            let DOCTOR_LAST_NAME_V = doctor.DOCTOR_LAST_NAME
            let DOCTOR_EMAIL_V = req.body.DOCTOR_EMAIL
            let ADDRESS_V = doctor.ADDRESS
            let GENDER_V = req.body.GENDER
            let DOB_V = req.body.DOB
            let SPECIALIZATION_V = req.body.SPECIALIZATION
            let PHONE_V = req.body.PHONE
            console.log(doctor);
            const rows = await db.query(
                `call ADD_NEW_Doctor(${DOCTOR_ADMIN_ID},${DOCTOR_CLINC_ID},'${DOCTOR_FIRST_NAME_V}','${DOCTOR_LAST_NAME_V}','${DOCTOR_EMAIL_V}','${ADDRESS_V}','${GENDER_V}','${DOB_V}','${SPECIALIZATION_V}','${PHONE_V}')`
            );
            const data = helper.emptyOrRows(rows);
            res.json({ message: "Success DOCTOR IS ADDED", data });

        } catch (error) {
            res.json({ message: "failed Process", error: error.message });

        }
}

static editDoctor =()=>{}
}

module.exports = DoctorController