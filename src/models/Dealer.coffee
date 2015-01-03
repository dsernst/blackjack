class window.Dealer extends Backbone.Model

  dealer = this

  initialize: (@deck, startingHand) ->
    @on
      'deal me in': @dealPlayer
      'hit me': @dealCard

    Players.each (player) ->
      player.on
        'deal me in': @dealPlayer, this
        'hit me': @dealCard, this
    , this

    @set
      hand: startingHand || new Hand

  dealPlayer: ->
    @set 'hand', new Hand [@deck.pop(), @deck.pop()], @deck

  dealCard: ->
    @get('hand').add(@deck.pop())
    @get('hand').last()

  go: ->
    # runs dealer logic to determine their own plays

  add: () ->
    # manually give a dealer some cards

  hit: ->
    @trigger 'hit me'

  stand: ->
    @trigger 'stand'
