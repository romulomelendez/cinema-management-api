import { Request, Response } from "express"

class ClientController {

	create = (req: Request, res: Response): Response<string> => {
		return res.status(200).json("Hello World!")
	}
}

export default new ClientController()
