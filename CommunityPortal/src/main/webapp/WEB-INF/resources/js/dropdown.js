// get the navbar toggle button and navbar collapse element
const navbarToggler = document.querySelector('.dropdown');
const navbarCollapse = document.querySelector('.dropdown-menu');

// add a click event listener to the navbar toggle button
navbarToggler.addEventListener('click', function() {
  // toggle the 'show' class on the navbar collapse element
    console.log('clicked');
  navbarCollapse.classList.toggle('show-dropdown');
  navbarCollapse.classList.toggle('show');
});
