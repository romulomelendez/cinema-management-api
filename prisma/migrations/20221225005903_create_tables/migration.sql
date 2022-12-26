-- CreateTable
CREATE TABLE "Movie" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "synopsis" TEXT NOT NULL,
    "release" TIMESTAMP(3) NOT NULL,
    "duration" INTEGER NOT NULL,
    "director" TEXT NOT NULL,
    "studio" TEXT NOT NULL,

    CONSTRAINT "Movie_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MovieRoom" (
    "id" TEXT NOT NULL,
    "capacity" INTEGER NOT NULL,

    CONSTRAINT "MovieRoom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ticket" (
    "id" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "id_movie" TEXT NOT NULL,
    "id_room" TEXT NOT NULL,

    CONSTRAINT "Ticket_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_id_movie_fkey" FOREIGN KEY ("id_movie") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_id_room_fkey" FOREIGN KEY ("id_room") REFERENCES "MovieRoom"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
