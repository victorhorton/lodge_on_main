
// let scrollPosition = 0;

// $(document).bind('scroll', event => {

//   debugger

//   if (window.pageYOffset > scrollPosition) {
//     $('.navbar').addClass('hide-navbar');
//   } else {
//     $('.navbar').removeClass('hide-navbar');
//   }
//   scrollPosition = window.pageYOffset;
// })

$(document).ready(checkPreferedColorScheme())

function checkPreferedColorScheme () {
  if (window.matchMedia) {
    var match = window.matchMedia('(prefers-color-scheme: dark)')
    toggleDarkMode(match.matches);
   
    match.addEventListener('change', e => {
        toggleDarkMode(match.matches);
    })
   
    function toggleDarkMode(state) {
        if (state) {
          document.getElementsByTagName("HTML")[0].dataset.bsTheme = 'dark'
        } else {
          document.getElementsByTagName("HTML")[0].dataset.bsTheme = 'light'
        }
    }
  }
}

$(document).ready(setTimeout(typeWriter, 40))

var i = 0;
var typeWriterCompany = 'The Lodge on Main: More than a brewery'; /* The text */
var speed = 40; /* The speed/duration of the effect in milliseconds */

function typeWriter() {
  if (i < typeWriterCompany.length) {

    document.getElementById("company-typewriter").innerHTML += typeWriterCompany.charAt(i);
    i++;
    setTimeout(typeWriter, speed);

  }
}

$(document).on('click', '.js-table-row-link', e => {
  window.location.href = `${e.currentTarget.dataset.url}`;
})
