$(document).on('click', '.js-nav-bars', e => {
  $('.uncollapsed-nav-bar').removeClass('d-none');
  $('.collapsed-nav-bar').addClass('d-none');
});

$(document).on('click', '.js-nav-x', e => {
  $('.collapsed-nav-bar').removeClass('d-none');
  $('.uncollapsed-nav-bar').addClass('d-none');
});

$(document).bind('scroll', e => {
  if (window.pageYOffset > 10) {
    $('.navbar').addClass('bg-transparent');
    $('.navbar').removeClass('bg-light');
  } else {
    $('.navbar').removeClass('bg-transparent');
    $('.navbar').addClass('bg-light');
  }
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