const button = document.querySelector("#helloButton");
const message = document.querySelector("#message");

button.addEventListener("click", () => {
  message.textContent = "Hello! 你的網頁已經可以互動了。";
});
