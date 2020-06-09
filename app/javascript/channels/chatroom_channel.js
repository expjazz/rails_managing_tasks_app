// import consumer from "./consumer";

// document.addEventListener("turbolinks:load", () => {
//   const chatroom_id = document.getElementById("chatroom_id").value;

//   console.log("test");

//   consumer.subscriptions.subscriptions.forEach((subscription) => {
//     consumer.subscriptions.remove(subscription);
//   });

//   consumer.subscriptions.create(
//     { channel: "ChatroomChannel", chatroom_id: chatroom_id },
//     {
//       connected() {
//         console.log("Connected to" + chatroom_id);
//       },

//       disconnected() {
//         // Called when the subscription has been terminated by the server
//       },

//       received(data) {
//         let list = [];
//         list.push(data.user.name);
//         list.push(data.recipient.name);
//         let b = document.getElementById(data.recipient.id);
//         let c = document.getElementById("current_user").value;
//         let a = document.getElementById(c);

//         if (
//           document.getElementById(data.user.name) != nil ||
//           document.getElementById(data.recipient.user.name) != nil
//         ) {
//           a.parentElement.innerHTML +=
//             "<p>" + data.user.name + ":" + data.notice.body + "</p>";
//         } //     "<p>" + data.user + ":" + data.message + "</p>";
//         // alert("b");
//       },
//     }
//   );
// });

// // list.includes(document.getElementById("user").value) &&
// //       list.includes(document.getElementById("recipient").value
// // if (true) {
// //   html = data.html;
// // }
// // notice.parentElement.innerHTML += html;
// // },
// // }
