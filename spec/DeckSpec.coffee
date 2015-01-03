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
    player = new Player()
    playerHand = player.get 'hand'
    it 'when cards are dealt, they should come from the end of the deck', ->
      deckSize = deck2.length
      lastOfDeck = deck2.last()
      player.trigger('hit me', player)
      lastOfHand = playerHand.last()
      assert.strictEqual lastOfDeck, lastOfHand, 'comparison'
      assert.strictEqual deck2.length, deckSize - 1, 'deck length'
