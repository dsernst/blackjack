class window.Player extends Backbone.Model
  initialize: (startingHand) ->
    @set
      outcome: null
      hand: startingHand || null

  start: ->
    @trigger 'deal me in'

  hit: ->
    @trigger 'hit me'
