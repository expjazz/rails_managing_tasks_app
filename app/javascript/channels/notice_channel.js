import consumer from "./consumer";

consumer.subscriptions.create("NoticeChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    let list = [];
    list.push(data.user);
    list.push(data.recipient);
    if (
      list.includes(document.getElementById("user").value) &&
      list.includes(document.getElementById("recipient").value)
    )
      alert(data.message);
  },
});
