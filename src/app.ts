import express, { json } from "express"
import cors from "cors"

import { clientRoutes } from "./routes/ClientRoutes"

const app = express()

app.use(cors())
app.use(json())
app.use(clientRoutes)

export { app }
