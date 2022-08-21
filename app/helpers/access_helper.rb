module AccessHelper
  def alert_close_button
    close_button('alert')
  end

  def modal_close_button
    close_button('modal')
  end

  def close_button(what_to_dismiss)
    button_tag(
      'aria-label': 'Close',
      'data-bs-dismiss': what_to_dismiss,
      class: 'btn-close',
      title: 'close',
      type: 'button'
    ) {}
  end  
end
