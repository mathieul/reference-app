stateManager = App.stateManager = App.StateManager.create()
App.initialize(stateManager)

jQuery ->
  stateManager.send('ready')
