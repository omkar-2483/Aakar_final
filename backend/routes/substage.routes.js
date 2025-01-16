import express from 'express'
import {
  getSubStagesByStageId,
  getSubStagesByProjectNumber,
  createSubStage,
  updateSubStage,
  getActiveSubStagesByStageId,
  getHistorySubStagesBySubStageId,
  deleteSubStage,
} from '../controllers/substage.controller.js'

const router = express.Router()

router.post('/subStages', createSubStage) //tested
router.get('/activeSubStages/:id', getActiveSubStagesByStageId) //tested
router.get('/historySubStages/:id', getHistorySubStagesBySubStageId) //tested
router.get('/subStages/:id', getSubStagesByStageId) //tested
router.get('/project/subStages/:projectNumber', getSubStagesByProjectNumber) //tested
router.put('/subStages/:id', updateSubStage) //tested
router.delete('/subStages/:id', deleteSubStage) //tested

export default router
