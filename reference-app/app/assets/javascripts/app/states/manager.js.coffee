App.StateManager = Ember.StateManager.extend
  initialState: 'bootstrap'

  states:
    bootstrap: Ember.State.extend
      ready: (manager) ->
        store = DS.Store.create
          revision: 4
          adapter: DS.RESTAdapter.create(bulkCommmit: false)
        manager.set('store', store)
