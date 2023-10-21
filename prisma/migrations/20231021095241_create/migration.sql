/*
  Warnings:

  - You are about to drop the column `id_movie` on the `Ticket` table. All the data in the column will be lost.
  - You are about to drop the column `id_room` on the `Ticket` table. All the data in the column will be lost.
  - You are about to drop the column `roomNumber` on the `Ticket` table. All the data in the column will be lost.
  - You are about to drop the `MovieRoom` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[seat]` on the table `Ticket` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[sessionId]` on the table `Ticket` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `seat` to the `Ticket` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sessionId` to the `Ticket` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Ticket" DROP CONSTRAINT "Ticket_id_movie_fkey";

-- DropForeignKey
ALTER TABLE "Ticket" DROP CONSTRAINT "Ticket_id_room_fkey";

-- AlterTable
ALTER TABLE "Ticket" DROP COLUMN "id_movie",
DROP COLUMN "id_room",
DROP COLUMN "roomNumber",
ADD COLUMN     "seat" TEXT NOT NULL,
ADD COLUMN     "sessionId" TEXT NOT NULL;

-- DropTable
DROP TABLE "MovieRoom";

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "movie_time" TIMESTAMP(3) NOT NULL,
    "movieId" TEXT NOT NULL,
    "roomId" TEXT NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Room" (
    "id" TEXT NOT NULL,
    "roomNumber" INTEGER NOT NULL,
    "capacity" INTEGER NOT NULL,
    "free_seats" INTEGER NOT NULL,

    CONSTRAINT "Room_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Session_movieId_key" ON "Session"("movieId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_roomId_key" ON "Session"("roomId");

-- CreateIndex
CREATE UNIQUE INDEX "Ticket_seat_key" ON "Ticket"("seat");

-- CreateIndex
CREATE UNIQUE INDEX "Ticket_sessionId_key" ON "Ticket"("sessionId");

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Room"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "Session"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
