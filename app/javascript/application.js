import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

import { setupAnimations } from "./custom/animations";
import { setupNavbar } from "./custom/navbar";

document.addEventListener("DOMContentLoaded", () => {
  setupAnimations();
  setupNavbar();
});
