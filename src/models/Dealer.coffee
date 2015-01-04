class window.Dealer extends Backbone.Model

  initialize: (@deck, @players, startingHand) ->
    @on
      'deal me in': @dealPlayer
      'hit me': @dealCard

    @set
      hand: startingHand || @dealDealer()

    @get('hand').on
      'add': @getScore
      'remove': @getScore
      'reset': @getScore
      , @

    @players.each (player) ->
      player.on
        'deal me in': @dealPlayer
        'hit me': @dealCard
        , @
    , @

  getScore: ->
    console.log('got score')
    @score = @get('hand').scores()

  dealPlayer: (player) ->
    player.set 'hand', new Hand [@deck.pop(), @deck.pop()]

  dealDealer: ->
    new Hand [@deck.pop(), @deck.pop()], true

  dealCard: (player) ->
    player.get('hand').add(@deck.pop())
    player.get('hand').last()

  pickMove: ->
    if @score.length is 1
      if @score[0] < 17
        @hit()
      else
        @stand()
    if @score.length is 2
      if @score[1] < 18
        @hit()
      else
        @stand()

  setHand: (cards) ->
    console.log "set hand"
    # manually give a dealer some cards
    @get('hand').reset cards
    @get('hand').on
      'add': @getScore
      'remove': @getScore
      'reset': @getScore
      , @

  hit: ->
    @trigger 'hit me', @

  stand: ->
    @trigger 'stand'
