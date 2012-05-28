App.ShowContactView = Ember.View.extend
  templateName: 'app/templates/contacts/show'
  classNames: ['show-contact']
  tagName: 'tr'

  doubleClick: ->
    @showEdit()
    false

  showEdit: ->
    @set('isEditing', true)

  hideEdit: ->
    @set('isEditing', false)

  destroyRecord: ->
    contact = @get('contact')
    contact.deleteRecord()
    App.store.commit()

    # contact
    #   .destroyResource()
    #   .fail((error) -> App.displayError(error))
    #   .done(-> App.contactsController.removeObject(contact))
