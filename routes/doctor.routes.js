const router = require("express").Router();
const DoctorController = require('../controller/doctor.controller')
const PatientController = require('../controller/patient.controller')
const authController = require('../controller/auth.controller')



router.get('/searchSpec',DoctorController.searchDoctorBySpecialization);
router.get('/search',DoctorController.searchDoctorByName);
router.post('/assignPatient',DoctorController.addDoctorPatient);
router.get('/getDoctorPatients/:id',DoctorController.getDoctorPatients);


module.exports = router;