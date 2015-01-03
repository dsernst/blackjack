assert = chai.assert

deck = new Deck()
hand = deck.dealPlayer()

describe 'hand', ->
  five = new Card 18
  nine = new Card 9
  testHand = new Hand [five, nine]

  it 'Deck.dealPlayer() creates a hand with two cards', ->
    assert.equal hand.length, 2

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

  it 'given cards valued above 11 and an Ace, Ace should value to 1', ->

  it 'score should never go above 30', ->
