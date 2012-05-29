App.ListContactsView = Ember.View.extend
  templateName: 'app/templates/contacts/list'
  contactsBinding: 'App.contactsController'

  showNew: ->
    @set('isNewVisible', true)
    false

  hideNew: ->
    @set('isNewVisible', false)

  refreshListing: ->
    App.contactsController.findAll()
    false
