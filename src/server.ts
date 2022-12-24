import express, { json } from "express"
import cors from "cors"

const app = express()
const PORT = 3000

app.use(cors())
app.use(json())

app.listen(PORT, () => console.log(`Server started on port ${PORT}`))
