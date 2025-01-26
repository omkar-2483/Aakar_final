import express from 'express'
import { Router } from 'express'
import {
  getAllProjects,
  getProjectById,
  createProject,
  deleteProject,
  updateProject,
  getActiveProjects,
  getHistoricalProjects,
  getCompanyList,
} from '../controllers/project.controller.js'
import { upload } from '../utils/multer.js'
import { authMiddleware } from '../middleware/authMiddleware.js'
const router = Router()

router.get('/project/companyList', getCompanyList)
router.get('/activeProjects', getActiveProjects) //tested
router.get('/historyProjects/:pNo', getHistoricalProjects) //tested
router.get('/projects', getAllProjects) //tested
router.get('/projects/:id', authMiddleware, getProjectById) //tested
router.post(
  '/projects',
  upload.fields([
    { name: 'projectPOLink', maxCount: 1 },
    { name: 'projectDesignDocLink', maxCount: 1 },
  ]),
  createProject
) //tested
router.delete('/projects/:id', deleteProject) //tested
router.put(
  '/projects/:id',
  upload.fields([
    { name: 'projectPOLink', maxCount: 1 },
    { name: 'projectDesignDocLink', maxCount: 1 },
  ]),
  updateProject
) //tested

export default router
