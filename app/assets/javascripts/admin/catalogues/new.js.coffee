($ '#cancel_link').click (event) ->
  event.preventDefault()

  ($ '.no-objects-found').show()

  ($ '#new_catalogue_link').show()
  ($ '#catalogues').html('')
