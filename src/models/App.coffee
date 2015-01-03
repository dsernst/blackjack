# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'players', players = new Players()
    @set 'dealer', new Dealer(deck, players)
    # @set 'playerHand', deck.dealPlayer()
    # @set 'dealerHand', deck.dealDealer()
    @set 'turn', 0
