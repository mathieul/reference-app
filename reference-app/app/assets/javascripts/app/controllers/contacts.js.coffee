App.contactsController = Em.ArrayController.create
  loadAll: (data) ->
    result = App.store.loadMany(App.Contact, data.contacts)
    contacts = DS.RecordArray.create
      type: App.Contact
      content: result.clientIds
      store: App.store
    @set('content', contacts)

  findAll: ->
    contacts = App.store.findAll(App.Contact)
    @set('content', contacts)
