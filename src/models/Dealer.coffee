class window.Dealer extends Backbone.Model
  initialize: (@deck) ->
    @on
      'deal me in': @dealPlayer()
      'hit me': @dealCard()

  dealPlayer: ->
    new Hand [@deck.pop(), @deck.pop()], @deck

  dealCard: ->
