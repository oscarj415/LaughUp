import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

// import { setupAnimations } from "./custom/animations";
// import { setupNavbar } from "./custom/navbar";

import gsap from "gsap";

function setupAnimations() {
  document.addEventListener("turbo:load", () => {
  const filterBtn = document.querySelector(".filter-btn");
  const closeBtn = document.querySelector(".close-btn");
  const filterContainer = document.querySelector(".filter-container");

  const mapBtn = document.querySelector(".map-btn");
  const closeBtn3 = document.querySelector(".close-btn3");
  const mapContainer = document.querySelector(".map-container");

  if (filterContainer) {
    gsap.set(filterContainer, {
      opacity: 1,
      pointerEvents: "none",
      x: "100%",
    });
  }

  if (mapContainer) {
    gsap.set(mapContainer, {
      opacity: 1,
      pointerEvents: "none",
      x: "-100%",
    });
  }

  if (filterBtn && filterContainer) {
    filterBtn.addEventListener("click", () => {
      filterBtn.disabled = true;
      gsap.to(filterContainer, {
        duration: 0.5,
        opacity: 1,
        pointerEvents: "auto",
        x: "0%",
        ease: "power1.out",
        onComplete: () => filterBtn.disabled = false
      });
    });
  }

  if (mapBtn && mapContainer) {
    mapBtn.addEventListener("click", () => {
      mapBtn.disabled = true;
      gsap.to(mapContainer, {
        duration: 0.5,
        opacity: 1,
        pointerEvents: "auto",
        x: "0%",
        ease: "power1.out",
        onComplete: () => mapBtn.disabled = false
      });
    });
  }

  if (closeBtn && filterContainer) {
    closeBtn.addEventListener("click", () => {
      gsap.to(filterContainer, {
        duration: 0.5,
        opacity: 1,
        pointerEvents: "none",
        x: "100%",
        ease: "power1.out"
      });
    });
  }

  if (closeBtn3 && mapContainer) {
    closeBtn3.addEventListener("click", () => {
      gsap.to(mapContainer, {
        duration: 0.5,
        opacity: 1,
        pointerEvents: "none",
        x: "-100%",
        ease: "power1.out"
      });
    });
  }

//   const mapElement = document.querySelector(".map");

//   let isExpanded = false;

//       mapElement.addEventListener("click", function () {
//         gsap.to(mapElement, {
//           height: isExpanded ? "150px" : "500px",
//           duration: 0.5,
//           ease: "power2.inOut",
//           onComplete: () => {
//             setTimeout(() => {
//               console.log('DEBUG', map);
//               map.resize();
//             }, 100);
//           },
//         });
//         isExpanded = !isExpanded;
//       });
  });
}

function setupNavbar() {
  document.addEventListener("turbo:load", function () {
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
}


document.addEventListener("DOMContentLoaded", () => {
  setupAnimations();
  setupNavbar();
});
