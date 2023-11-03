import { Router } from "express"

import ClientController from './controllers/ClientController'

const router = Router()

router.get("/", ClientController.create)

export { router }
