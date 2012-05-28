App.ShowContactView = Ember.View.extend
  templateName: 'app/templates/contacts/show'
  classNames: ['show-contact']
  tagName: 'tr'

  showEdit: (event) ->
    event.preventDefault()
    @set('isEditing', true)

  hideEdit: ->
    @set('isEditing', false)

  destroyRecord: (event) ->
    event.preventDefault()
    contact = @get('contact')
    contact.deleteRecord()
    App.store.commit()
