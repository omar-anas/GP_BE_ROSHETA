const router = require("express").Router();
const DoctorController = require('../controller/doctor.controller')
const doctorMiddleware = require('../middlewares/doctorAuth.middleware')


router.patch('/editProfile', doctorMiddleware, DoctorController.editDoctor);
router.put('/fuid/add', doctorMiddleware, DoctorController.addFUID)

router.get('/get/:id', doctorMiddleware, DoctorController.getDoctor);

router.get('/searchSpec', DoctorController.searchDoctorBySpecialization);
router.get('/search', DoctorController.searchDoctorByName);
router.post('/assignPatient', DoctorController.addDoctorPatient);
router.get('/getDoctorPatients/:id', DoctorController.getDoctorPatients);


module.exports = router;