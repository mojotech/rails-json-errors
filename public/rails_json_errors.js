window.RJE = window.RJW || {};

window.RJE.displayJsonErrors = function(rawJson) {
  var json, message;
  message = [];
  json = $.parseJSON(rawJson);
  _.each(json.errors, function(val, key) {
    return _.each(val, function(elm) {
      return message.push(key + ": " + elm);
    });
  });
  return alert(message.join("\n"));
};
