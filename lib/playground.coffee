PlaygroundView = require './playground-view'

module.exports =
  PlaygroundView: null

  activate: (state) ->
    @playgroundView = new PlaygroundView(state.PlaygroundViewState)

  deactivate: ->
    @playgroundView.destroy()

  serialize: ->
    playgroundViewState: @playgroundView.serialize()
