const router = require("express").Router();
const DoctorController = require('../controller/doctor.controller')
const PatientController = require('../controller/patient.controller')

router.get('/doctor/getAll',DoctorController.getAllDoctors);
router.get('/doctor/get/:id',DoctorController.getDoctor);
router.post('/doctor/add',DoctorController.addDoctor);
router.patch('/doctor/edit/:id',DoctorController.editDoctor);


router.get('/patient/getAll',PatientController.getAllPatients);
router.get('/patient/get/:id',PatientController.getPatient);
router.post('/patient/add',PatientController.addPatient);
router.patch('/patient/edit/:id',PatientController.editPatient);

module.exports = router;