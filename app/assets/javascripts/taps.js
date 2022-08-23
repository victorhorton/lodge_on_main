$(document).on('click', '.ajax-update-position', e => {
  const id = e.currentTarget.dataset.id;
  const position = e.currentTarget.dataset.position;

  $.ajax({
    url: `/taps/${id}`,
    method: 'PATCH',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: {tap: {
      position: position
    }},
    success: resp => {
      location.reload();
    },
    error: resp => {
      location.reload();
    }
  });  
});
