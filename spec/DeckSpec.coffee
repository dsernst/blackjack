assert = chai.assert

describe 'deck', ->
  deck = new Deck()

  describe "deck constructor", ->

    it "should create a card collection with length 52", ->
      assert.strictEqual deck.length, 52

    it "should have all uniq cards", ->
      uniqCollection = _.uniq deck.models
      assert.deepEqual uniqCollection, deck.models

    it "should have 13 cards in each suit", ->
      suits = [0, 0, 0, 0]
      deck.each (card) ->
        if card.get("suitName") is "Spades" then suits[0]++
        if card.get("suitName") is "Hearts" then suits[1]++
        if card.get("suitName") is "Clubs" then suits[2]++
        if card.get("suitName") is "Diamonds" then suits[3]++
      assert suits.reduce (memo, suit) ->
        memo and suit is 13
      , 1

  describe 'hit', ->
    deck2 = deck.clone()
    hand = deck2.dealPlayer()
    it 'should give the last card from the deck', ->
      assert.strictEqual deck2.length, 50
      assert.strictEqual deck2.last(), hand.hit()
      assert.strictEqual deck2.length, 49
