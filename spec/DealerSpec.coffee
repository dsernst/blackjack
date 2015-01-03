assert = chai.assert

ace = new Card 27
two = new Card 2
four = new Card 4
five = new Card 18
six = new Card 6
nine = new Card 9
ten = new Card 10
jack = new Card 11
testGame = new App()
dealer = testGame.get 'dealer'
dealerHand = dealer.get 'hand'
player = testGame.get('players').at(0)
playerHand = player.get('hand')

describe 'dealer', ->
  describe 'play behavior', ->

    dealerStood = null
    dealerHit = null

    beforeEach ->
      dealerStood = sinon.spy dealer.stand
      dealerHit = sinon.spy dealer.hit

    it 'when dealer\'s score is below 17, dealer hits', ->
      temp = dealerHit.callCount
      dealer.setHand [nine, five]
      dealer.pickMove()
      assert.equal dealerHit.callCount, temp + 1

    it 'when dealer\'s score is 17 or greater, dealer stands', ->
      temp = dealerStood.callCount
      dealer.setHand [nine, ten]
      dealer.pickMove()
      assert.equal dealerStood.callCount, temp + 1
    it 'when dealer has soft 17 (max score 17), dealer hits', ->
      temp = dealerHit.callCount
      dealer.setHand [ace, six]
      dealer.pickMove()
      assert.equal dealerHit.callCount, temp + 1

    it 'when dealer has hard 17 (min score 17), dealer stands', ->
      temp = dealerStood.callCount
      dealer.setHand [ten, six, ace]
      dealer.pickMove()
      assert.equal dealerStood.callCount, temp + 1

  describe 'dealing behavior', ->
    it 'when player asks to be dealt in, deal player two cards', ->
      handsize = playerHand.length
      player.trigger('deal me in', player)
      assert.equal playerHand.length, handsize + 2

    it 'when player asks to be hit, deal them a card', ->
      handsize = playerHand.length
      player.trigger('hit me', player)
      assert.equal playerHand.length, handsize + 1

    it 'Dealer.dealDealer() creates a hand with two cards, one revealed, one not revealed', ->
      assert.equal dealerHand.length, 2
      faceUp = dealerHand.reduce (memo, card) ->
        memo += +card.get 'revealed'
      , 0
      assert.equal faceUp, 1
