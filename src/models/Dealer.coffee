class window.Dealer extends Backbone.Model

  initialize: (@deck, @players, startingHand) ->
    @on
      'deal me in': @dealPlayer
      'hit me': @dealCard

    @players.each (player) ->
      player.on
        'deal me in': @dealPlayer
        'hit me': @dealCard
        , @
    , @

    @set
      hand: startingHand || @dealDealer()

  dealPlayer: (player) ->
    player.set 'hand', new Hand [@deck.pop(), @deck.pop()]

  dealDealer: ->
    new Hand [@deck.pop(), @deck.pop()], true

  dealCard: (player) ->
    player.get('hand').add(@deck.pop())
    player.get('hand').last()

  pickMove: ->
    # runs dealer logic to determine their own plays

  setHand: (cards) ->
    # manually give a dealer some cards
    @set('hand', new Hand(cards))

  hit: ->
    @trigger 'hit me'

  stand: ->
    @trigger 'stand'
