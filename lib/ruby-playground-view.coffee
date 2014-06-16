{View} = require 'atom'

module.exports =
class RubyPlaygroundView extends View
  @content: ->
    @div class: 'ruby-playground overlay from-top', =>
      @div "The RubyPlayground package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "ruby-playground:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "RubyPlaygroundView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
