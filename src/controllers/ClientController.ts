import { Request, Response } from "express"

class ClientController {

	buyTickets = (req: Request, res: Response): Response<string> => {

		try {

			// const { sessionId, price, seats } = req.body

			return res.status(200).json("OK")

		} catch (error) {
			throw new Error(error)
		}
	}
}

export default new ClientController()
