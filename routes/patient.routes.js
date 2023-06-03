const router = require("express").Router()
const PatientController = require('../controller/patient.controller')
const patinetMiddleware = require('../middlewares/patientAuth.middleware')

router.post('/register', PatientController.addPatient)

router.patch('/edit/:id', patinetMiddleware, PatientController.editPatient)

router.post('/symptom/add', patinetMiddleware, PatientController.addSymptom)
router.get('/symptom/getAll', patinetMiddleware, PatientController.getSymptoms)
router.delete('/symptom/delete', patinetMiddleware, PatientController.deleteSymptom)

router.get('/get/:id', PatientController.getPatient)
router.get('/getDoctors', patinetMiddleware, PatientController.getDoctors)


module.exports = router