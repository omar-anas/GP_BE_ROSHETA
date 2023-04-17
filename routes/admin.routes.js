const router = require("express").Router();
const DoctorController = require('../controller/doctor.controller')
const PatientController = require('../controller/patient.controller')
const VedioController = require('../controller/vedio.controller')
const SymptomsController = require('../controller/symptom.controller')
const authController = require('../controller/auth.controller')

const adminMiddleware = require('../middlewares/adminAuth.middleware')

router.get('/doctor/getAll',adminMiddleware,DoctorController.getAllDoctors);
router.get('/doctor/get/:id',adminMiddleware,DoctorController.getDoctor);
router.post('/doctor/add',adminMiddleware,DoctorController.addDoctor);
router.patch('/doctor/edit/:id',adminMiddleware,DoctorController.editDoctor);


router.get('/patient/getAll',adminMiddleware,PatientController.getAllPatients);
router.get('/patient/get/:id',adminMiddleware,PatientController.getPatient);
router.post('/patient/add',adminMiddleware,PatientController.addPatient);
router.patch('/patient/edit/:id',adminMiddleware,PatientController.editPatient);


router.get('/vedio/getAll',adminMiddleware,VedioController.getAllVedios);
router.get('/vedio/get/:id',adminMiddleware,VedioController.getVedio);
router.post('/vedio/add',adminMiddleware,VedioController.addVedio);
router.patch('/vedio/edit/:id',adminMiddleware,VedioController.editVedio);


router.get('/symptom/getAll',adminMiddleware,SymptomsController.getAllSymptoms);
router.get('/symptom/get/:id',adminMiddleware,SymptomsController.getSymptom);
router.post('/symptom/add',adminMiddleware,SymptomsController.addSymptom);
router.patch('/symptom/edit/:id',adminMiddleware,SymptomsController.editSymptom);



router.post('/login',authController.AdminLogin);

module.exports = router;