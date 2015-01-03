class window.Player extends Backbone.Model
  initialize: (startingHand) ->
    @set
      outcome: null
      hand: startingHand || new Hand

  start: ->
    @trigger 'deal me in'

  hit: ->
    @trigger 'hit me'

  setHand: (cards) ->
    # manually give some cards
    @set('hand', new Hand(cards))
