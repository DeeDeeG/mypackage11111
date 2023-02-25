Mypackage11111View = require './mypackage11111-view'
{CompositeDisposable} = require 'atom'

module.exports = Mypackage11111 =
  mypackage11111View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @mypackage11111View = new Mypackage11111View(state.mypackage11111ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @mypackage11111View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'mypackage11111:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @mypackage11111View.destroy()

  serialize: ->
    mypackage11111ViewState: @mypackage11111View.serialize()

  toggle: ->
    console.log 'Mypackage11111 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
