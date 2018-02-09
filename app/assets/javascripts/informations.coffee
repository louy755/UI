$(document).on "turbolinks:load", ->
  $('#info-link').on 'click', (e) ->
    e.preventDefault()
    $('#info-section').fadeToggle()

$(document).on 'turbolinks:load', ->
  $('#zom').hover (->
    $(this).animate
      height: '250px'
      width: '250px'
    return
  ), ->
    $(this).animate
      height: '272px'
      width: '275px'
    return
  return
