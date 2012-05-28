App.NewContactView = Ember.View.extend
  tagName:       'form'
  templateName:  'app/templates/contacts/edit'

  init: ->
    @_super()
    @transaction = App.store.transaction()
    @set('contact', @transaction.createRecord(App.Contact, {}))

  didInsertElement: ->
    @_super()
    @$('input:first').focus()

  cancelForm: ->
    @transaction.rollback()
    @get('parentView').hideNew()

  submit: (event) ->
    event.preventDefault()

    contact = @get('contact')
    validationErrors = contact.validate()

    if validationErrors?
      App.displayError(validationErrors)
    else
      @transaction.commit()
      @get('parentView').hideNew()

    # contact
    #   .saveResource()
    #   .fail((error) -> App.displayError(error))
    #   .done(=>
    #     App.contactsController.pushObject(contact)
    #     @get('parentView').hideNew()
    #   )
