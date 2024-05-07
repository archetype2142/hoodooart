import "@hotwired/turbo-rails";
import "./controllers";

import "trix"
import "@rails/actiontext"

import PhotoSwipeLightbox from 'photoswipe/lightbox';
import PhotoSwipe from 'photoswipe';
import 'photoswipe/dist/photoswipe.css'

const lightbox = new PhotoSwipeLightbox({
  gallery: '#gallery--getting-started',
  children: 'a',
  pswpModule: () => PhotoSwipe
});

lightbox.init();
