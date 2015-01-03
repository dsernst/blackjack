assert = chai.assert

deck = new Deck()
dealer = new Dealer(deck)
ace = new Card 27
two = new Card 2
four = new Card 4
five = new Card 18
six = new Card 6
nine = new Card 9
ten = new Card 10
jack = new Card 11

describe 'dealer', ->
  describe 'play behavior', ->
    it 'when dealer\'s score is below 17, dealer hits', ->
      dealer.add nine, five
      dealer.go()
      assert dealer.hand.hit.wasCalled

    it 'when dealer\'s score is 17 or greater, dealer stands', ->
      dealer.add nine, ten
      dealer.go()
      assert dealer.hand.stand.wasCalled
    it 'when dealer has soft 17 (max score 17), dealer hits', ->
      dealer.add ace, six
      dealer.go()
      assert dealer.hand.hit.wasCalled

    it 'when dealer has hard 17 (min score 17), dealer stands', ->
      dealer.add ten, six, ace
      dealer.go()
      assert dealer.hand.stand.wasCalled

  describe 'dealing behavior', ->
    it 'when player asks to be dealt in, deal player two cards', ->
      player = new Player([])
      handsize = player.get('hand').length
      player.trigger('deal me in')
      assert.equal player.get('hand').length, handsize + 2

    it 'when player asks to be hit, deal them a card', ->
      player = new Player([])
      handsize = player.get('hand').length
      player.trigger('hit me')
      assert.equal player.get('hand').length, handsize + 1

    it 'Dealer.dealDealer() creates a hand with two cards, one revealed, one not revealed', ->
      assert.equal dealerHand.length, 2
      faceUp = dealerHand.reduce (memo, card) ->
        memo += +card.get 'revealed'
      , 0
      assert.equal faceUp, 1
