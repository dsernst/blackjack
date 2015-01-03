assert = chai.assert

testGame = new App()
two = new Card 2
five = new Card 18
nine = new Card 9
ten = new Card 10
jack = new Card 11
ace = new Card 27
player = testGame.get('playerHand')
dealer = testGame.get('dealerHand')
turn = testGame.get('turn')

describe 'game logic', ->

  describe 'turns', ->
    it 'initialize turn at 0', ->
      assert.equal testGame.get('turn'), 0

    it 'if dealt blackjack, turn ends', ->
      temp = testGame.get('turn')
      player.trigger('blackjack')
      assert.equal testGame.get('turn'), temp + 1

    it 'if busts, turn ends', ->
      temp = testGame.get('turn')
      player.trigger('busted')
      assert.equal testGame.get('turn'), temp + 1

    it 'if dealer is dealt blackjack, users\' turns end', ->
      assert.equal testGame.get('turn'), 0
      dealer.trigger('blackjack')
      # TODO generalize end-of-game turn number
      assert.equal testGame.get('turn'), 2


    it 'when dealer stands, game ends', ->
      assert.equal testGame.get('turn'), 1
      dealer.trigger('stand')
      # TODO generalize end-of-game turn number
      assert.equal testGame.get('turn'), 2


  describe 'outcomes', ->
    it 'if user busted, user loses', ->
    it 'if dealer busted, and user doesn\'t, user wins', ->

    it 'when game ends, if user\'s score is higher than dealer\'s, user wins', ->
    it 'when game ends, if user\'s score is less than dealer\'s, user loses', ->
    it 'when game ends, if user\'s score matches dealer\'s, user draws', ->

    it 'if user was dealt blackjack, and dealer wasn\'t, user wins', ->
    it 'if dealer was dealt blackjack, and user wasn\'t, user loses', ->
