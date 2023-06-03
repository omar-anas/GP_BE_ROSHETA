const router = require("express").Router()
const PatientController = require('../controller/patient.controller')
const patinetMiddleware = require('../middlewares/patientAuth.middleware')

router.post('/register', PatientController.addPatient)
router.post('/addSymptom', patinetMiddleware, PatientController.addSymptom)

router.get('/get/:id', PatientController.getPatient)
router.get('/getDoctors', patinetMiddleware, PatientController.getDoctors)

router.patch('/edit/:id', patinetMiddleware, PatientController.editPatient)

module.exports = router