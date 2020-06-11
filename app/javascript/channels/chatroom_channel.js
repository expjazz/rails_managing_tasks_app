import consumer from "./consumer";

// const chatroom_id = document.getElementById("chatroom_id").value;

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
      let normalChat = document.getElementById("normalChat");

      if (sender === currentUser[0] || recipient === currentUser[0]) {
        let chatWindow = document.getElementById("chat-default");
        let dNone = document.getElementById("dis-none");
        dNone.classList.remove("d-none");
        if (sender === currentUser[0] || recipient === currentUser[0]){
        chatWindow.innerHTML += ` <div class="card-body msg_card_body">
          <div class="d-flex justify-content-start mb-4">
            <div class="img_cont_msg">
              <img src="${data.image_sender}" class="rounded-circle user_img_msg">
            </div>
            <div class="msg_cotainer">
              ${data.sender.name}: ${data.notice.body}
              <span class="msg_time">${data.date}</span>
            </div>
          </div>
          </div>`;} else if (recipient === currentUser[0]) {
            chatWindow.innerHTML += ` <div class="card-body msg_card_body">
            <div class="d-flex justify-content-start mb-4">
              <div class="img_cont_msg">
                <img src=${data.image_recipient} class="rounded-circle user_img_msg">
              </div>
              <div class="msg_cotainer">
                ${data.sender.name}: ${data.notice.body}
                <span class="msg_time">${data.date}</span>
              </div>
            </div>
            </div>`; 
          }
        // "<p>" + data.sender.name + ":" + data.notice.body + "</p>"

        let count = 0;
        let count2 = 0;
        let formFluid = document.getElementById("chat-form-fluid");
        formFluid.action = "/notice_create";
        let newRecipient = document.getElementById("notice_recipient_id");
        if (sender === currentUser[0] && count === 0) {
          count++;
        } else if (recipient === currentUser[0] && count2 === 0) {
          count2++;
          newRecipient.value = data.sender.id;
        }
      }
      let scroll_buttom = function () {
        if ($("#chat-default").length > 0) {
          $("#chat-default").scrollTop($("#chat-default")[0].scrollHeight);
        }
      };

      let submit_message = function () {
        $("#notice_body").on("keydown", function (e) {
          if (e.keyCode == 13) {
            $("#button").click();
            e.target.value = "";
          }
        });
      };
      scroll_buttom();
      submit_message();
    },
  }
);

// // list.includes(document.getElementById("user").value) &&
// //       list.includes(document.getElementById("recipient").value
// // if (true) {
// //   html = data.html;
// // }
// // notice.parentElement.innerHTML += html;
// // },
// // }
