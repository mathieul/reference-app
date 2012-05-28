window.App = App = Ember.Application.create()

App.store = DS.Store.create
  revision: 4
  adapter: DS.RESTAdapter.create(bulkCommmit: false)
