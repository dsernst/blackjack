class window.PlayersView extends Backbone.View

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.append @collection.map (player) ->
      new PlayerView(model: player).$el
