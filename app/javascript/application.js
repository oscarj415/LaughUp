import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import gsap from "gsap";

document.addEventListener("DOMContentLoaded", () => {
  // Filter-Container Animation
  const filterBtn = document.querySelector(".filter-btn");
  const closeBtn = document.querySelector(".close-btn");
  const filterContainer = document.querySelector(".filter-container");

  const mapBtn = document.querySelector(".map-btn");
  const closeBtn3 = document.querySelector(".close-btn3");
  const mapContainer = document.querySelector(".map-container");

  gsap.set(filterContainer, {
    opacity: 1,
    pointerEvents: "none", // Deaktiviert Interaktionen zu Beginn
    x: "100%", // Verschiebt den Container nach rechts außerhalb des sichtbaren Bereichs
  });

  gsap.set(mapContainer, {
    opacity: 1,
    pointerEvents: "none", // Deaktiviert Interaktionen zu Beginn
    x: "-100%", // Verschiebt den Container nach rechts außerhalb des sichtbaren Bereichs
  });

  // Event Listener für das Öffnen des Menüs
  filterBtn.addEventListener("click", () => {
    gsap.to(filterContainer, {
      duration: 0.5,
      opacity: 1,
      pointerEvents: "auto",  // Aktiviert Interaktionen
      x: "0%",  // Bewegt den Container in den sichtbaren Bereich
      ease: "bounce.out",
    });
  });

  mapBtn.addEventListener("click", () => {
    gsap.to(mapContainer, {
      duration: 0.5,
      opacity: 1,
      pointerEvents: "auto",  // Aktiviert Interaktionen
      x: "0%",  // Bewegt den Container in den sichtbaren Bereich
      ease: "bounce.out",
    });
  });

  // Event Listener für das Schließen des Menüs
  closeBtn.addEventListener("click", () => {
    gsap.to(filterContainer, {
      duration: 0.5,
      opacity: 1,
      pointerEvents: "none",  // Deaktiviert Interaktionen
      x: "100%",  // Bewegt den Container wieder nach rechts
      ease: "bounce.out",
    });
  });

  closeBtn3.addEventListener("click", () => {
    gsap.to(mapContainer, {
      duration: 0.5,
      opacity: 1,
      pointerEvents: "none",  // Deaktiviert Interaktionen
      x: "-100%",  // Bewegt den Container wieder nach rechts
      ease: "bounce.out",
    });
  });
});

document.addEventListener("DOMContentLoaded", function () {
  const navbarToggler = document.querySelector(".navbar-toggler");
  const navbarCollapse = document.querySelector("#navbarSupportedContent");
  const closeButton = document.querySelector(".close-btn2");

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
