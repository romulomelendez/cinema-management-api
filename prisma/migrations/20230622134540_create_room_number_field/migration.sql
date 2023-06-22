/*
  Warnings:

  - Added the required column `roomNumber` to the `MovieRoom` table without a default value. This is not possible if the table is not empty.
  - Added the required column `roomNumber` to the `Ticket` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "MovieRoom" ADD COLUMN     "roomNumber" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Ticket" ADD COLUMN     "roomNumber" INTEGER NOT NULL;
