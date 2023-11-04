import { Router } from "express"

import ClientController from '../controllers/ClientController'

const clientRoutes = Router()

clientRoutes.post("/buytickets", ClientController.buyTickets)

export { clientRoutes }
