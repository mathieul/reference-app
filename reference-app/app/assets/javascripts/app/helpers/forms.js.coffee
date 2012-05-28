Handlebars.registerHelper 'submitButton', (text) ->
  new Handlebars.SafeString("<button type=\"submit\" class=\"btn btn-primary\">#{text}</button>")
