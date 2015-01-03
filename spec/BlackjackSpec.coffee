assert = chai.assert

deck = new Deck()
hand = deck.dealPlayer()
dealerHand = deck.dealDealer()
two = new Card 2
five = new Card 18
nine = new Card 9
ten = new Card 10
jack = new Card 11
ace = new Card 27

describe 'game logic', ->

  describe 'turns', ->
    it 'if dealt blackjack, turn ends', ->
      hand.blackjack()


    it 'if busts, turn ends', ->
    it 'if dealer is dealt blackjack, users\' turns end', ->
    it 'when dealer stands, game ends', ->

  describe 'outcomes', ->
    it 'if user busted, user loses', ->
    it 'if dealer busted, and user doesn\'t, user wins', ->

    it 'when game ends, if user\'s score is higher than dealer\'s, user wins', ->
    it 'when game ends, if user\'s score is less than dealer\'s, user loses', ->
    it 'when game ends, if user\'s score matches dealer\'s, user draws', ->

    it 'if user was dealt blackjack, and dealer wasn\'t, user wins', ->
    it 'if dealer was dealt blackjack, and user wasn\'t, user loses', ->
