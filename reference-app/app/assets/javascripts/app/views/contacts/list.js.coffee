App.ListContactsView = Ember.View.extend
  templateName: 'app/templates/contacts/list'
  contactsBinding: 'App.contactsController'

  showNew: (event) ->
    event.preventDefault()
    @set('isNewVisible', true)

  hideNew: ->
    @set('isNewVisible', false)

  refreshListing: (event) ->
    event.preventDefault()
    App.contactsController.findAll()
