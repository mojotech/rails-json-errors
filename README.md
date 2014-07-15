# Rails JSON Errors

Easily parse and handle standard json error packets from a Rails API

# Installation

Installation is easy. Simply `bower install rails-json-errors` and include `public/rails_json_errors.js` in your document.

# Usage

### `RJE.displayJSONErrors( rawJSON, [displayMethod] )`

### rawJSON
#### type: String
The JSON returned from the server. If there is an `errors` key, it will parse the Rails errors returned. Otherwise it will do nothing.

### displayMethod
#### type: Function( Array messages )
The method that receives an array of error messages of the form `errorType: errorMessage`. Unless this is passed, the default is to join these with new lines and give them to `alert`.

## Rails

In your controller if you want to return an error have something like the following

```ruby-on-rails
render json: { errors: my_model.errors }, status: 409 # or some other appropriate 40X
```

## Front End

These can either be set as global ajax error event handlers

### CoffeeScript (yay)
```coffeescript
$(document).ajaxError (event, jqXHR) ->
  RJS.displayJSONErrors jqXHR.responseText
```

### JavaScript (meh, alright)
```javascript
$(document).ajaxError(function(event, jqXHR) {
  RJS.displayJSONErrors(jqXHR.responseText);
});
```

Or given to a promise

### CoffeeScript
```coffeescript
somePromiseReturningCall.fail (jqXHR) ->
  RJS.displayJSONErrors jqXHR.responseText
```

### JavaScript
```javascript
somePromiseReturningCall.fail(function(jqXHR) {
  return RJS.displayJSONErrors(jqXHR.responseText);
});
```
