const router = require("express").Router()
const PatientController = require('../controller/patient.controller')
const patinetMiddleware = require('../middlewares/patientAuth.middleware')

router.post('/register', PatientController.addPatient)
router.post('/symptom/add', patinetMiddleware, PatientController.addSymptom)
router.get('/symptom/getAll', patinetMiddleware, PatientController.getSymptoms)
router.delete('/symptom/delete', patinetMiddleware, PatientController.deleteSymptom)

router.get('/get/:id', PatientController.getPatient)
router.get('/getDoctors', patinetMiddleware, PatientController.getDoctors)

router.patch('/edit/:id', patinetMiddleware, PatientController.editPatient)

module.exports = router