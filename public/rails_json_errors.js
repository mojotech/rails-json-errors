
(function(root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(factory);
  } else if (typeof exports === 'object') {
    module.exports = factory(require, exports, module);
  } else {
    root.RJE = factory();
  }
}(this, function(require, exports, module) {

return ({
  displayJSONErrors: function(rawJson, displayMethod) {
    var messages, parsed;
    parsed = JSON.parse(rawJson);
    if (parsed.errors == null) {
      return;
    }
    messages = [];
    Object.keys(parsed.errors).map(function(errType) {
      var errors;
      errors = parsed.errors[errType];
      if (!(errors instanceof Array)) {
        errors = [errors];
      }
      return errors.map(function(errMsg) {
        return messages.push("" + errType + ": " + errMsg);
      });
    });
    if (typeof displayMethod === 'function') {
      return displayMethod(messages);
    } else {
      return alert(messages.join('\n'));
    }
  }
});
;

}));
