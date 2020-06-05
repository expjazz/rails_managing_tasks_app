document.addEventListener("DOMContentLoaded", init);

function init() {
  console.log("test");

  let employeeToggle = document.querySelector(".selector-of");
  let managerToggle = document.querySelector(".selector-on");
  let manager = document.querySelector(".manager");
  let employee = document.querySelector(".employee");

  let changer = function (e) {
    let temp = document.querySelector(".selector-on");
    let temp2 = e.currentTarget;
    if (Array.from(temp2.classList).includes("selector-of")) {
      temp2.classList.remove("selector-of");
      temp.classList.remove("selector-on");
      temp.classList.add("selector-of");
      temp2.classList.add("selector-on");
      manager.innerHTML = "";
      employee.innerHTML = `<div class="form-group">
      <label for="user_employee_function">Function</label>
      <input class="form-control" type="text" name="user[employee][function]" id="user_employee_function">
    </div>`;
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
      employee.innerHTML = "";
      manager.innerHTML = `<div class="form-group">
      <label for="user_manager_function">Function</label>
      <input class="form-control" type="text" name="user[manager][function]" id="user_manager_function">
    </div>`;
    }
  };
  employeeToggle.addEventListener("click", changer);

  managerToggle.addEventListener("click", changer2);
}
