import { setCallback } from "client/chat";
import "components/message/message";
import "./messages.css";

const messages = document.querySelector(".js-messages");
const content = messages.querySelector(".js-messages--content");

function scrollToBottom() {
  content.scrollTop = content.scrollHeight;
}

scrollToBottom();

// ActionCableで新しいメッセージを1件受け取るたびに
// このコード片を呼び出すよう`chat.js`に伝える
setCallback(message => {
  content.insertAdjacentHTML("beforeend", message);
  scrollToBottom();
});
