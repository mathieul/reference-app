App.contactsController = Ember.ArrayController.create
  loadAll: (data) ->
    @findAll()
    # store = App.stateManager.get('store')
    # result = store.loadMany(App.Contact, data.contacts)
    # contacts = DS.RecordArray.create
    #   type: App.Contact
    #   content: result.clientIds
    #   store: store
    # @set('content', contacts)

  findAll: ->
    store = App.stateManager.get('store')
    contacts = store.findAll(App.Contact)
    @set('content', contacts)
