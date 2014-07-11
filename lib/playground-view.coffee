{View} = require 'atom'

module.exports =
class PlaygroundView extends View
  @content: ->
    @div class: 'playground tool-panel panel-right', style: "width: 265px;", =>
      @div class: "inset-panel padded", 'Some content'

  initialize: (serializeState) ->
    atom.workspaceView.command "playground:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "PlaygroundView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.appendToRight(this)
      # editorView = atom.workspaceView.getActiveView()
      # if @isValidEditorView(editorView)
      #   # editorView.appendToRight(this)
      #   paneView = editorView.getPane()
      #   paneView.append(this)

  isValidEditorView: (editorView) ->
    return true
    # editorView?.getEditor()?.getGrammar()?.scopeName is 'source.go'
