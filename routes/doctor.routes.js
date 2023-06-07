const router = require("express").Router();
const DoctorController = require('../controller/doctor.controller')
const doctorMiddleware = require('../middlewares/doctorAuth.middleware')


router.patch('/editProfile', doctorMiddleware, DoctorController.editDoctor);
router.put('/fuid/add', doctorMiddleware, DoctorController.addFUID)

router.get('/get/:id', doctorMiddleware, DoctorController.getDoctor);

router.get('/searchSpec',DoctorController.searchDoctorBySpecialization);
router.get('/search',DoctorController.searchDoctorByName);
router.get('/searchDoctorPatients',doctorMiddleware,DoctorController.DoctorSearchPatientsByName);
router.post('/assignPatient',DoctorController.addDoctorPatient);
router.get('/getDoctorPatients/:id',DoctorController.getDoctorPatients);

router.post('/addNote',doctorMiddleware,DoctorController.addNote)
router.patch('/editNote',doctorMiddleware,DoctorController.editNote)
router.get('/getNote',doctorMiddleware,DoctorController.getNote)
router.delete('/delNote',doctorMiddleware,DoctorController.delNote)

module.exports = router;