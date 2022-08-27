
let scrollPosition = 0;

$(document).bind('scroll', event => {
  if (window.pageYOffset > scrollPosition) {
    $('.navbar').addClass('d-none');
  } else {
    $('.navbar').removeClass('d-none');
  }
  scrollPosition = window.pageYOffset;
})

$(document).ready(setTimeout(typeWriter, 50))

var i = 0;
var typeWriterCompany = 'The Lodge on Main: More than a brewery'; /* The text */
var speed = 50; /* The speed/duration of the effect in milliseconds */

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