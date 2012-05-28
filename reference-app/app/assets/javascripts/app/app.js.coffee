Ember.CP_DEFAULT_CACHEABLE   = true
Ember.VIEW_PRESERVES_CONTEXT = true

window.App = App = Ember.Application.create()

App.displayError = (error) ->
  if typeof error is 'string'
    alert(error)
  else if typeof error is 'object' and error.responseText?
    # TODO - further process json errors
    alert(e.responseText)
  else
    alert("An unexpected error occurred.")
