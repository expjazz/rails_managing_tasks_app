document.addEventListener("DOMContentLoaded", init);

function init() {
  console.log("test");

  let employeeToggle = document.querySelector(".selector-of");
  let b = document.querySelector(".selector-on");
  let manager = document.querySelector(".hidden-manager");
  let changer = function (e) {
    let temp = document.querySelector(".selector-on");
    let temp2 = e.currentTarget;
    if (Array.from(temp2.classList).includes("selector-of")) {
      temp2.classList.remove("selector-of");
      temp.classList.remove("selector-on");
      temp.classList.add("selector-of");
      temp2.classList.add("selector-on");
      let employeeField = document.querySelector(".employee");
      employeeField.classList.remove("d-none");
      manager.innerHTML = "";
    }
  };
  let changer2 = function (e) {
    let temp = document.querySelector(".selector-on");
    let temp2 = e.currentTarget;
    if (Array.from(temp2.classList).includes("selector-of")) {
      temp2.classList.remove("selector-of");
      temp.classList.remove("selector-on");
      temp.classList.add("selector-of");
      temp2.classList.add("selector-on");
      let employeeField = document.querySelector(".employee");
      employeeField.classList.add("d-none");
      manager.innerHTML =
        '<input value="Manager" type="hidden" name="user[manager]" id="user_manager">';
    }
  };
  employeeToggle.addEventListener("click", changer);

  b.addEventListener("click", changer2);
}
