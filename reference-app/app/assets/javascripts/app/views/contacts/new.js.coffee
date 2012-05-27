App.NewContactView = Ember.View.extend
  tagName:       'form'
  templateName:  'app/templates/contacts/new'

  init: ->
    @_super()
    @set('contact', App.Contact.create())

  didInsertElement: ->
    @_super()
    @$('input:first').focus()

  cancelForm: ->
    @get('parentView').hideNew()

  submit: (event) ->
    event.preventDefault()

    contact = @get('contact')
    contact
      .saveResource()
      .fail((error) -> App.displayError(error))
      .done(=>
        App.contactsController.pushObject(contact)
        @get('parentView').hideNew()
      )
