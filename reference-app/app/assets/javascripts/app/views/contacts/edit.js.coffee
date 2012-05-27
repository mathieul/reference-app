App.EditContactView = Ember.View.extend
  tagName:       'form'
  templateName:  'app/templates/contacts/edit'

  init: ->
    @_super()
    contactCopy = @get('parentView').get('contact').copy()
    @set('contact', contactCopy)

  didInsertElement: ->
    @_super()
    @$('input:first').focus()

  cancelForm: ->
    @get('parentView').hideEdit()

  submit: (event) ->
    event.preventDefault()

    contact = @get('contact')
    contact
      .saveResource()
      .fail((error) -> App.displayError(error))
      .done(=>
        parentView = @get('parentView')
        parentView.get('contact').duplicateProperties(contact)
        parentView.hideEdit()
      )
