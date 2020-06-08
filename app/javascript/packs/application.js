// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
import "bootstrap";
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener("DOMContentLoaded", init);

function init() {
  // Select the node that will be observed for mutations
  const targetNode = document.getElementById("notice-container");

  // Options for the observer (which mutations to observe)
  const config = { attributes: true, childList: true, subtree: true };
  let count = targetNode.childElementCount;
  let count2 = 0;
  // Callback function to execute when mutations are observed
  const callback = function (mutationsList, observer) {
    // Use traditional 'for loops' for IE 11
    for (let mutation of mutationsList) {
      if (
        mutation.type === "childList" &&
        targetNode.childElementCount > count
      ) {
        count += 1;
        count2 = count + 1 - targetNode.childElementCount;
        targetNode.parentElement.firstElementChild.textContent += ` (${count2})`;
        console.log("A child node has been added or removed.");
      } else if (mutation.type === "attributes") {
        console.log(
          "The " + mutation.attributeName + " attribute was modified."
        );
      }
    }
  };

  // Create an observer instance linked to the callback function
  const observer = new MutationObserver(callback);

  // Start observing the target node for configured mutations
  observer.observe(targetNode, config);

  // Later, you can stop observing

  // c.addEventListener("DOMNodeInserted", (e) => {
  //   c.parentElement.textContent += 1;
  // });
}
