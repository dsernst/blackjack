assert = chai.assert

ace = new Card 27
two = new Card 2
five = new Card 18
nine = new Card 9
ten = new Card 10
jack = new Card 11

describe 'hand', ->

  it 'given two cards, without Ace, Hand.scores() should equal their sum', ->
    testHand = new Hand [five, nine]
    assert.deepEqual testHand.scores(), [14]

  it 'given an Ace and another card, score could equal other card plus 1 or plus 11', ->
    testHand = new Hand [five, ace]
    assert.deepEqual testHand.scores(), [6, 16]

  it 'hand busts above 21', ->
    testHand = new Hand [five, nine]
    assert.equal testHand.busted(), false
    testHand.add jack
    assert.equal testHand.busted(), true

  it 'hand with ace that could bust or not, should not bust', ->
    testHand = new Hand [five, nine, ace]
    assert.equal testHand.busted(), false

  it 'if dealt 21, blackjack!', ->
    testHand = new Hand [jack, ace]
    assert.equal testHand.blackjack(), true, "j, a"
    testHand = new Hand [jack, ten, ace]
    assert.equal testHand.blackjack(), false, "j, 10, a"
