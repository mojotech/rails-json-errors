mocha = require('mocha')
assert = require('assert')
sinon = require('sinon')
RJE = require('../')

describe 'RJE', ->
  before ->
    @jsonErrors =
      JSON.stringify(
        errors:
          foo: ['bar', 'baz']

      )

  describe 'guard against no errors', ->
    it 'returns early if no errors are in the json', ->
      spy = sinon.spy()
      RJE.displayJSONErrors JSON.stringify(something: 'without errors'), spy

      assert spy.notCalled

  describe 'displayMethod argument', ->
    describe 'using `alert`', ->
      before ->
        @alertSpy = sinon.spy()
        global.alert = @alertSpy

      it 'calls `alert` if no displayMethod is passed', ->
        RJE.displayJSONErrors @jsonErrors

        assert @alertSpy.called

      it 'calls `alert` if displayMethod is not a function', ->
        RJE.displayJSONErrors @jsonErrors, 'not a function'

        assert @alertSpy.called

      it 'joins the messages before sending them to `alert`', ->
        RJE.displayJSONErrors @jsonErrors

        assert @alertSpy.calledWith(['foo: bar', 'foo: baz'].join('\n'))

    describe 'when given a displayMethod', ->
      it 'passes it an array of error messages', ->
        spy = sinon.spy()
        RJE.displayJSONErrors @jsonErrors, spy

        assert spy.called
        assert.deepEqual spy.firstCall.args[0], ['foo: bar', 'foo: baz']

  it 'can also take a single error', ->
    spy = sinon.spy()
    RJE.displayJSONErrors JSON.stringify(errors: {errorType: 'one error'}), spy

    assert.deepEqual spy.firstCall.args[0], ['errorType: one error']
