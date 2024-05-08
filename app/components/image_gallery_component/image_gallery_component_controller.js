import PhotoSwipeLightbox from 'photoswipe/lightbox';
import PhotoSwipe from 'photoswipe';
import 'photoswipe/dist/photoswipe.css'

// 

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [];

  connect() {
    const lightbox = new PhotoSwipeLightbox({
      gallery: '#gallery--getting-started',
      children: 'a',
      pswpModule: () => PhotoSwipe
    });

    lightbox.init();
  }
}

