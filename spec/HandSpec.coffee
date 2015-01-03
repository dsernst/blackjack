assert = chai.assert

deck = new Deck()
hand = deck.dealPlayer()

describe 'hand', ->
  two = new Card 2
  five = new Card 18
  nine = new Card 9
  jack = new Card 11
  ace = new Card 27
  testHand = new Hand [five, nine]

  it 'Deck.dealPlayer() creates a hand with two cards', ->
    assert.equal hand.length, 2

  it 'Hand.hit() adds a card to the hand', ->
      hand.hit()
      assert.equal hand.length, 3

  it 'Deck.dealDealer() creates a hand with two cards, one revealed, one not revealed', ->
    dealerHand = deck.dealDealer()
    assert.equal dealerHand.length, 2
    faceUp = dealerHand.reduce (memo, card) ->
      memo += +card.get 'revealed'
    , 0
    assert.equal faceUp, 1

  it 'can also be created with an array of cards in hand', ->
    assert.equal testHand.length, 2

  it 'given two cards, without Ace, Hand.scores() should equal their sum', ->
    assert.equal testHand.scores(), [14]

  it 'given an Ace and another card, score could equal other card plus 1 or plus 11', ->
    anotherTestHand = new Hand [five, ace]
    assert.equal anotherTestHand.scores(), [6, 16]

  it 'hand busts above 21', ->
    anotherTestHand = new Hand [five, nine]
    assert.equal anotherTestHand.busted(), false
    anotherTestHand.add jack
    assert.equal anotherTestHand.busted(), true

  it 'hand hits 21 exactly, then blackjack!', ->
    anotherTestHand = new Hand [two, nine]
    assert.equal anotherTestHand.blackjack(), false
    anotherTestHand.add jack
    assert.equal anotherTestHand.blackjack(), true

  it 'hand with ace that could bust or not, should not bust', ->
    anotherTestHand = new Hand [five, nine, ace]
    assert.equal anotherTestHand.busted(), false

