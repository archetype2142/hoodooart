import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener("turbo:load", (e) => {
  var prod_button = document.querySelector('#prod-dropdown');
  var prod_dropdown = document.querySelector('#prod-body');

  prod_button.addEventListener('click', e => {
    console.log(prod_dropdown.classList)
    prod_dropdown.classList.toggle('hidden');
  })
});