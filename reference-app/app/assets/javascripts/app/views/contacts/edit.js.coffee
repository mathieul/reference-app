App.EditContactView = Ember.View.extend
  tagName:       'form'
  templateName:  'app/templates/contacts/edit'

  didInsertElement: ->
    store = App.stateManager.get('store')
    @transaction = store.transaction()
    @transaction.add(@get('contact'))
    @_super()
    @$('input:first').focus()

  cancelForm: (event) ->
    event.preventDefault()
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
