App.EditContactView = Ember.View.extend
  tagName:       'form'
  templateName:  'app/templates/contacts/edit'

  didInsertElement: ->
    @transaction = App.store.transaction()
    @transaction.add(@get('contact'))
    @_super()
    @$('input:first').focus()

  cancelForm: ->
    @transaction.rollback()
    @get('parentView').hideEdit()

  submit: (event) ->
    event.preventDefault()

    contact = @get('contact')
    validationErrors = contact.validate()

    if validationErrors?
      App.displayError(validationErrors)
    else
      @transaction.commit()
      @get('parentView').hideEdit()

    # contact
    #   .saveResource()
    #   .fail((error) -> App.displayError(error))
    #   .done(=>
    #     parentView = @get('parentView')
    #     parentView.get('contact').duplicateProperties(contact)
    #     parentView.hideEdit()
    #   )
