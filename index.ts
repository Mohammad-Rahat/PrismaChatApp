import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

// prisma.user
//   .create({
//     data: {
//       name: "Rahat 2",
//       isOnline: false,
//       avatar: "",
//     },
//   })
//   .then((data) => {
//     console.log(data);
//   });

// prisma.conversation
//   .create({
//     data: {
//       users: {
//         create: [
//           {
//             userId: "a63c86e3-c8e6-4415-b188-a3768c8f4dd2",
//           },
//           {
//             userId: "7c456a78-c997-495a-91ac-1ff9c4a6a623",
//           },
//         ],
//       },
//     },
//   })
//   .then((data) => {
//     console.log(data);
//   });

// prisma.conversation
//   .update({
//     where: {
//       id: "5e16fb34-ff26-4df2-a39b-4467349a6184",
//     },
//     data: {
//       messages: {
//         create: {
//           sentBy: "7c456a78-c997-495a-91ac-1ff9c4a6a623",
//           message: "Hi there",
//         },
//       },
//     },
//   })
//   .then((data) => {
//     console.log(data);
//   });

prisma.conversation
  .findFirst({
    select: {
      users: true,
      messages: true,
    },
  })
  .then((data) => {
    console.log(data);
  });
