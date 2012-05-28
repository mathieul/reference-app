App.NewContactView = Ember.View.extend
  tagName:       'form'
  templateName:  'app/templates/contacts/edit'

  init: ->
    @_super()
    store = App.stateManager.get('store')
    @transaction = store.transaction()
    @set('contact', @transaction.createRecord(App.Contact, {}))

  didInsertElement: ->
    @_super()
    @$('input:first').focus()

  cancelForm: (event) ->
    event.preventDefault()
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
