import createChannel from "client/cable";

let callback; // 後で関数を保持するための変数を宣言

const chat = createChannel("ChatChannel", {
  received({ message }) {
    if (callback) callback.call(null, message);
  }
});

// メッセージを1件送信する: `perform`メソッドは、対応するRubyメソッド（chat_channel.rbで定義）を呼び出す
// ここがJavaScriptとRubyをつなぐ架け橋です！
function sendMessage(message) {
  chat.perform("send_message", { message });
}

// メッセージを1件受け取る: ChatChannelで何かを受信すると
// このコールバックが呼び出される
function setCallback(fn) {
  callback = fn;
}

export { sendMessage, setCallback };
