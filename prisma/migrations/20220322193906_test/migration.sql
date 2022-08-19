/*
  Warnings:

  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `isOnline` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `UsersOnConversation` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Changed the type of `userId` on the `UsersOnConversation` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "UsersOnConversation" DROP CONSTRAINT "UsersOnConversation_userId_fkey";

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "isOnline",
ADD COLUMN     "isOnline" BOOLEAN NOT NULL DEFAULT false,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "UsersOnConversation" DROP CONSTRAINT "UsersOnConversation_pkey",
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "UsersOnConversation_pkey" PRIMARY KEY ("userId", "conversationId");

-- AddForeignKey
ALTER TABLE "UsersOnConversation" ADD CONSTRAINT "UsersOnConversation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
