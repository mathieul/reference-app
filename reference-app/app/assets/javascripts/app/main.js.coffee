# App.stateManager is useful for debugging,
# but don't use it directly in application code.
window.App = Ember.Application.create()
# stateManager = App.stateManager = App.StateManager.create()
# App.initialize(stateManager)

jQuery ->
  # stateManager.send('ready')
