const router = require("express").Router();
const DoctorController = require('../controller/doctor.controller')
const PatientController = require('../controller/patient.controller')

router.get('/doctor/getAll',DoctorController.getAllDoctors);
router.post('/doctor/add',DoctorController.addDoctor);
router.patch('/doctor/edit/:id',DoctorController.editDoctor);

module.exports = router;