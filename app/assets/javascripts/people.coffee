# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.enabled').on 'click', (event) ->
    event.preventDefault()
    personId = $(this).data('id')
    $.ajax
      url: "/people/#{personId}/enable"
      type: 'PATCH'
      success: (result) ->
        return
    return

  $('.select-box').select2()
  setTimeout (->
    $('.alert').fadeOut()
    return
  ), 3000

$(document).on 'turbolinks:load', ->
  $('#zam').hover (->
    $(this).animate
      height: '40px'
      width: '120px'
    return
  ), ->
    $(this).animate
      height: "30px"
      width: '94px'
    return
  return

$(document).on 'turbolinks:load', ->
  $('.zen').hover (->
    $(this).animate
      height: '35px'
      width: '35px'
    return
  ), ->
    $(this).animate
      height: "30px"
      width: '30px'
    return
  return
