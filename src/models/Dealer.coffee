class window.Dealer extends Backbone.Model

  dealer = this

  initialize: (@deck, @players, startingHand) ->
    @on
      'deal me in': @dealPlayer
      'hit me': @dealCard

    @players.each (player) ->
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

  setHand: (cards) ->
    # manually give a dealer some cards
    @set('hand', new Hand(cards))

  hit: ->
    @trigger 'hit me'

  stand: ->
    @trigger 'stand'
