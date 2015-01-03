assert = chai.assert

testGame = new App()
two = new Card 2
four = new Card 4
five = new Card 18
nine = new Card 9
ten = new Card 10
jack = new Card 11
ace = new Card 27
player = testGame.get('players').at(0)
dealer = testGame.get('dealer')

describe 'blackjack logic', ->

  describe 'turns', ->
    turn = -> testGame.get 'turn'
    it 'initialize turn at 0', ->
      assert.equal turn(), 0

    it 'if dealt blackjack, turn ends', ->
      temp = turn()
      player.trigger 'blackjack'
      assert.equal turn(), temp + 1

    it 'if busts, turn ends', ->
      temp = turn()
      player.trigger 'busted'
      assert.equal turn(), temp + 1

    it 'if dealer is dealt blackjack, users\' turns end', ->
      assert.equal turn(), 0
      dealer.trigger 'blackjack'
      # TODO generalize end-of-game turn number
      assert.equal turn(), 2


    it 'when dealer stands, game ends', ->
      assert.equal turn(), 1
      dealer.trigger 'stand'
      # TODO generalize end-of-game turn number
      assert.equal turn(), 2


  describe 'outcomes', ->
    outcome = -> player.get 'outcome'
    it 'if user busted, user loses', ->
      player.trigger 'busted'
      assert.equal outcome(), 'lost'

    it 'if dealer busted, and user doesn\'t, user wins', ->
      assert.notEqual outcome(), 'lost'
      dealer.trigger 'busted'
      assert.equal outcome(), 'won'

    it 'when game ends, if user\'s score is higher than dealer\'s, user wins', ->
      player.setHand [nine, ten]
      dealer.setHand [two, five, jack]
      assert.equal outcome(), null
      testGame.trigger 'ended'
      assert.equal outcome(), 'won'

    it 'when game ends, if user\'s score is less than dealer\'s, user loses', ->
      player.setHand [two, five, jack]
      dealer.setHand [nine, ten]
      assert.equal outcome(), null
      testGame.trigger 'ended'
      assert.equal outcome(), 'lost'

    it 'when game ends, if user\'s score matches dealer\'s, user draws', ->
      player.setHand [four, five, jack]
      dealer.setHand [nine, ten]
      assert.equal outcome(), null
      testGame.trigger 'ended'
      assert.equal outcome(), 'draw'

    it 'if user was dealt blackjack, and dealer wasn\'t, user wins', ->
      testGame.trigger 'starts'
      player.setHand [ace, jack]
      dealer.setHand [nine, ten]
      assert.equal outcome(), 'won'

    it 'if dealer was dealt blackjack, and user wasn\'t, user loses', ->
      testGame.trigger 'starts'
      player.setHand [nine, ten]
      dealer.setHand [ace, jack]
      assert.equal outcome(), 'lost'
