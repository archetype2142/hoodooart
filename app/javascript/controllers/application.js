import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener("turbo:load", (e) => {
  var prod_button = document.querySelector('#prod-dropdown');
  var prod_dropdown = document.querySelector('#prod-body');

  prod_button.addEventListener('mouseover', e => {
    prod_dropdown.classList.toggle('hidden');
  })

  prod_dropdown.addEventListener('mouseleave', e => {
    prod_dropdown.classList.add('hidden');
  })
});
