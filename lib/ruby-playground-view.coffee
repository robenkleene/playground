{View} = require 'atom'

module.exports =
class RubyPlaygroundView extends View
  @content: ->
    @div class: 'ruby-playground tool-panel panel-right', style: "width: 265px;", =>
      @div class: "inset-panel padded", 'Some content'
      # @div "The RubyPlayground package is Alive! It's ALIVE!", class: "message"

  # @content: ->
  #   @div class: "changer tool-panel panel-bottom", =>
  #     @div class: "panel", =>
  #       @div class: "panel-heading", "Modified Files"
  #       @div class: "panel-body padded", outlet: 'modifiedFilesContainer', =>
  #         @ul class: 'modified-files-list', outlet: 'modifiedFilesList', =>
  #           @li 'Modified File Test'
  #           @li 'Modified File Test'

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
      atom.workspaceView.appendToRight(this)
