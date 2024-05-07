import { Controller } from "@hotwired/stimulus";
import Glide from "@glidejs/glide";
import "@glidejs/glide/dist/css/glide.core.css"
import "@glidejs/glide/dist/css/glide.theme.css"

export default class extends Controller {
  static targets = [];

  connect() {
    new Glide('.glide', {
      autoplay: 2000,
      wrapperWidth: 100,
    }).mount();
  }
}

console.log('test');
