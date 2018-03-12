// client/chat.jsからsendMessageをimportする必要がある
import { sendMessage } from "client/chat";
import "./message-form.css";

const form = document.querySelector(".js-message-form");
const input = form.querySelector(".js-message-form--input");
const submit = form.querySelector(".js-message-form--submit");

function submitForm() {
  // sendMessageを呼び出し、その結果Rubyのsend_messageメソッドが呼ばれて
  // ActiveRecordでMessageインスタンスが作成される
  sendMessage(input.value);
  input.value = "";
  input.focus();
}

// コマンドキー（またはCtrlキー）+Enterでメッセージを送信できる
input.addEventListener("keydown", event => {
  if (event.keyCode === 13 && event.metaKey) {
    event.preventDefault();
    submitForm();
  }
});

// ボタンをクリックして送信してもよい
submit.addEventListener("click", event => {
  event.preventDefault();
  submitForm();
});
