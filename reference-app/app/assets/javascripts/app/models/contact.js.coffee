App.Contact = DS.Model.extend
  firstName: DS.attr('string')
  lastName:  DS.attr('string')

  fullName: (->
    [@get('firstName'), @get('lastName')].join(' ')
  ).property('firstName', 'lastName')

  validate: ->
    [first, last] = [@get('firstName'), @get('lastName')]
    if first is undefined or first is '' or last is undefined or last is ''
      "Contacts require a first name and a last name."
