assert = chai.assert

describe "deck constructor", ->
  collection = new Deck()

  it "should create a card collection with length 52", ->
    assert.strictEqual collection.length, 52

  it "should have all uniq cards", ->
    uniqCollection = _.uniq collection.models
    assert.deepEqual uniqCollection, collection.models
