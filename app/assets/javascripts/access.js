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
