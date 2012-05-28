App.contactsController = Em.ArrayController.create
  loadAll: (data) ->
    # contacts = App.store.loadMany(App.Contact, data)
    # @set('content', contacts)
    @findAll()

  findAll: ->
    contacts = App.store.findAll(App.Contact)
    @set('content', contacts)
