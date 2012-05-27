App.StateManager = Ember.StateManager.extend
  initialState: 'bootstrap'

  states:
    bootstrap: Ember.State.extend
      ready: (manager) ->
        # put your bootstrap logic here
        store = DS.Store.create
          adapter: DS.RESTAdapter.create()
          revision: 4
        manager.set('store', store)
