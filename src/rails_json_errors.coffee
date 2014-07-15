displayJSONErrors: (rawJson, displayMethod) ->
  parsed = JSON.parse(rawJson)
  return unless parsed.errors?

  messages = []
  Object.keys(parsed.errors).map (errType) ->
    errors = parsed.errors[errType]
    errors = [errors] unless errors instanceof Array

    errors.map (errMsg) ->
      messages.push "#{errType}: #{errMsg}"

  if typeof displayMethod is 'function'
    displayMethod messages
  else
    alert messages.join('\n')
