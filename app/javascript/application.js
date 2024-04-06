import "@hotwired/turbo-rails";
import "./controllers";

import "trix"
import "@rails/actiontext"

document.addEventListener("turbo:load", (e) => {
  var prod_button = document.querySelector('#prod-dropdown');
  var prod_dropdown = document.querySelector('#prod-body');

  prod_button.addEventListener('click', e => {
    console.log(prod_dropdown.classList)
    prod_dropdown.classList.toggle('hidden');
  })
})