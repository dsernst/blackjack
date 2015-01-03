class window.Player extends Backbone.Model
  initialize: ->
    @set
      outcome: null
      hand: null

    @trigger 'deal me in'
