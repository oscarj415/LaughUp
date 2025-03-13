// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"


document.addEventListener("DOMContentLoaded", function () {
  const navbarToggler = document.querySelector(".navbar-toggler");
  const navbarCollapse = document.querySelector("#navbarSupportedContent");
  const closeButton = document.querySelector(".close-menu");

  if (navbarToggler && navbarCollapse && closeButton) {
    navbarToggler.addEventListener("click", function () {
      navbarCollapse.classList.add("show");
    });

    closeButton.addEventListener("click", function () {
      navbarCollapse.classList.remove("show");
    });

    // Close navbar when clicking outside of it
    document.addEventListener("click", function (event) {
      let clickedElement = event.target;
      if (navbarCollapse.contains(clickedElement) === false && navbarToggler.contains(clickedElement) === false) {
        navbarCollapse.classList.remove("show");
      }
    });
  }
});
