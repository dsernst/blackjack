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

describe 'hand', ->
  testHand = new Hand [five, nine]

  it 'Deck.dealPlayer() creates a hand with two cards', ->
    assert.equal hand.length, 2

  it 'Hand.hit() adds a card to the hand', ->
    hand.hit()
    assert.equal hand.length, 3

  it 'Deck.dealDealer() creates a hand with two cards, one revealed, one not revealed', ->
    assert.equal dealerHand.length, 2
    faceUp = dealerHand.reduce (memo, card) ->
      memo += +card.get 'revealed'
    , 0
    assert.equal faceUp, 1

  it 'can also be created with an array of cards in hand', ->
    assert.equal testHand.length, 2

  it 'given two cards, without Ace, Hand.scores() should equal their sum', ->
    assert.deepEqual testHand.scores(), [14]

  it 'given an Ace and another card, score could equal other card plus 1 or plus 11', ->
    anotherTestHand = new Hand [five, ace]
    assert.deepEqual anotherTestHand.scores(), [6, 16]

  it 'hand busts above 21', ->
    anotherTestHand = new Hand [five, nine]
    assert.equal anotherTestHand.busted(), false
    anotherTestHand.add jack
    assert.equal anotherTestHand.busted(), true

  it 'hand with ace that could bust or not, should not bust', ->
    anotherTestHand = new Hand [five, nine, ace]
    assert.equal anotherTestHand.busted(), false

  it 'if dealt 21, blackjack!', ->
    anotherTestHand = new Hand [jack, ace]
    assert.equal anotherTestHand.blackjack(), true, "j, a"
    anotherTestHand = new Hand [jack, ten, ace]
    assert.equal anotherTestHand.blackjack(), false, "j, 10, a"

