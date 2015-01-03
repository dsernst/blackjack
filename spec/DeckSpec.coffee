assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  describe "deck constructor", ->
    collection = new Deck()

    it "should create a card collection with length 52", ->
      assert.strictEqual collection.length, 52

    it "should have all uniq cards", ->
      uniqCollection = _.uniq collection.models
      assert.deepEqual uniqCollection, collection.models

    it "should have 13 cards in each suit", ->
      suits = [0, 0, 0, 0]
      collection.each (card) ->
        if card.get("suitName") is "Spades" then suits[0]++
        if card.get("suitName") is "Hearts" then suits[1]++
        if card.get("suitName") is "Clubs" then suits[2]++
        if card.get("suitName") is "Diamonds" then suits[3]++
      assert suits.reduce (memo, suit) ->
        memo and suit is 13
      , 1


  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49
