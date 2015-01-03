class window.Players extends Backbone.Collection
  model: Player

  initialize: ->
    @add new Player
