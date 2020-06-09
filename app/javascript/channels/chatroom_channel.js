import consumer from "./consumer";

document.addEventListener("turbolinks:load", () => {
  // const chatroom_id = document.getElementById("chatroom_id").value;

  console.log("test");

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription);
  });

  consumer.subscriptions.create(
    { channel: "ChatroomChannel", chatroom_id: 1 },
    {
      connected() {
        console.log("Connected to");
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        let currentUser = document.getElementById("notice-chatss").parentElement
          .classList;
        let sender = data.sender.username;
        let recipient = data.recipient.username;

        console.log(sender);
        console.log(recipient);
        console.log(currentUser);
        if (sender === currentUser[0] || recipient === currentUser[0]) {
          let chatWindow = document.getElementById("chat-default");
          chatWindow.classList.remove("d-none");
          chatWindow.innerHTML += "<p>" + data.notice.body + "</p>";
          let formFluid = document.getElementById("chat-form-fluid");
          formFluid.action = "./notice_create";
          let newRecipient = document.getElementById("notice_recipient_id");
          if (sender === currentUser[0]) {
            newRecipient.value = data.recipient.id;
          } else if (recipient === currentUser[0]) {
            newRecipient.value = data.sender.id;
          }
        }
      },
    }
  );
});

// // list.includes(document.getElementById("user").value) &&
// //       list.includes(document.getElementById("recipient").value
// // if (true) {
// //   html = data.html;
// // }
// // notice.parentElement.innerHTML += html;
// // },
// // }
