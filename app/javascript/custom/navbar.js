export function setupNavbar() {
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
