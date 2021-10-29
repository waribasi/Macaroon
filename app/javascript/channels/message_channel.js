import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
  debugger
  const html = `<p>${data.content.message}</p>`;
  const messages = document.getElementById('messages');
  const newMessage = document.getElementById('message_message');
  messages.insertAdjacentHTML('afterbegin', html);
  newMessage.value='';
  }
});