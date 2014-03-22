PLACEHOLDERS = [
  'Perhaps Ruby?',
  'Heaven forbid, PHP?',
  'Per chance the Puppet DSL?',
  'Have you considered Jade?',
  'You should try SASS sometime'
]

add_input = () ->
  text = PLACEHOLDERS.shift()
  if text is undefined then text = 'You work way too much'
  $('#inputs').append "<input type='text' class='form-control workform' placeholder='#{text}'>"


empty_input_exists = () ->
  not $('input').toArray().every (x) -> x.value.length > 0


collect_input_values = () ->
  i.value for i in $('input') when i.value.length > 0


$(document).ready () ->

  $(document).on 'focusout', '.workform', (e) ->
    if not empty_input_exists()
      add_input()

  $('button').click (e) ->
    input_values = collect_input_values()
    $.ajax {
      url: '/post',
      type: 'POST',
      data: { payload: JSON.stringify(input_values) }
      success: (payload) -> console.log payload
    }
