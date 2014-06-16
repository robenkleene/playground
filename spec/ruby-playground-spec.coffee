{WorkspaceView} = require 'atom'
RubyPlayground = require '../lib/ruby-playground'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "RubyPlayground", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('ruby-playground')

  describe "when the ruby-playground:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.ruby-playground')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'ruby-playground:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.ruby-playground')).toExist()
        atom.workspaceView.trigger 'ruby-playground:toggle'
        expect(atom.workspaceView.find('.ruby-playground')).not.toExist()
