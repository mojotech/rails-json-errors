window.RJE = window.RJW || {}

window.RJE.displayJsonErrors = (rawJson) ->
  message = []
  json = $.parseJSON(rawJson)
  _.each json.errors, (val, key) ->
    _.each val, (elm) ->
      message.push(key+": "+elm)

  alert message.join("\n")
