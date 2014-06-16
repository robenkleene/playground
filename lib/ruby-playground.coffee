RubyPlaygroundView = require './ruby-playground-view'

module.exports =
  rubyPlaygroundView: null

  activate: (state) ->
    @rubyPlaygroundView = new RubyPlaygroundView(state.rubyPlaygroundViewState)

  deactivate: ->
    @rubyPlaygroundView.destroy()

  serialize: ->
    rubyPlaygroundViewState: @rubyPlaygroundView.serialize()
