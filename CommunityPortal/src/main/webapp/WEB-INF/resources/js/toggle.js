  function togglePassword() {
  let password = document.querySelector(".password");
  let togglePassword = document.querySelector(".toggle-position");

  if (password.type === "password") {
    password.type = "text";
    togglePassword.src = "image/eye.svg";
  } else {
    password.type = "password";
    togglePassword.src = "image/eye-close.svg";
  
  }
}
  
