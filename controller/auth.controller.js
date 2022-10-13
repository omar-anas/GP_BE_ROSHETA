const DoctorController = require('../controller/doctor.controller');
const PatientController = require('../controller/patient.controller');
class authController {

    static login_Handler = (req , res ) => {
       const myRe =  /(@Rosheta.com)/g;
       const flag  = myRe.test(req.body.EMAIL);
       let userType 
       
       if(flag){
        DoctorController.dotcorLogin(req , res);
    }else{
        PatientController.PatientLogin(req , res);
    }

    }


}

module.exports = authController