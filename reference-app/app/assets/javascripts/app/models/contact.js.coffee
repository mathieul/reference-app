App.Contact = Ember.Resource.extend
  resourceUrl:         '/contacts'
  resourceName:        'contact'
  resourceProperties:  ['first_name', 'last_name']

  validate: ->
    [first, last] = [@get('first_name'), @get('last_name')]
    if first is undefined or first is '' or last is undefined or last is ''
      "Contacts require a first name and a last name."

  fullName: Ember.computed(->
    [@get('first_name'), @get('last_name')].join(' ')
  ).property('first_name', 'last_name')
