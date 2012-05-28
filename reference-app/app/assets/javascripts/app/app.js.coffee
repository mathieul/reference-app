window.App = App = Ember.Application.create()

App.store = DS.Store.create
  revision: 4
  adapter: DS.RESTAdapter.create(bulkCommmit: false)

App.displayError = (error) ->
  if typeof error is 'string'
    alert(error)
  else if typeof error is 'object' and error.responseText?
    # TODO - further process json errors
    alert(e.responseText)
  else
    alert("An unexpected error occurred.")
