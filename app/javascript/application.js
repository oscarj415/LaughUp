// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

import gsap from "gsap";

document.addEventListener("DOMContentLoaded", () => {
  const filterBtn = document.querySelector(".filter-btn");
  const closeBtn = document.querySelector(".close-btn");
  const filterContainer = document.querySelector(".filter-container");

  gsap.set(filterContainer, {
    opacity: 0,
    pointerEvents: "none", // Deaktiviert Interaktionen zu Beginn
    x: "100%", // Verschiebt den Container nach rechts außerhalb des sichtbaren Bereichs
  });

  // Event Listener für das Öffnen des Menüs
  filterBtn.addEventListener("click", () => {
    // Animate von rechts in den sichtbaren Bereich
    gsap.to(filterContainer, {
      duration: 0.5,
      opacity: 1,
      pointerEvents: "auto",  // Aktiviert Interaktionen
      x: "0%",  // Bewegt den Container in den sichtbaren Bereich
    });
  });

  // Event Listener für das Schließen des Menüs
  closeBtn.addEventListener("click", () => {
    // Animate zurück nach rechts außerhalb des sichtbaren Bereichs
    gsap.to(filterContainer, {
      duration: 0.5,
      opacity: 0,
      pointerEvents: "none",  // Deaktiviert Interaktionen
      x: "100%",  // Bewegt den Container wieder nach rechts
    });
  });



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
