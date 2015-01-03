assert = chai.assert

collection = new Deck()
card = collection.pop()

describe 'card', ->
  it 'should have a value', ->
    assert card.get 'value'

  it 'should have a rankName', ->
    assert card.get 'rankName'

  it 'should have a suitName', ->
    assert card.get 'suitName'

  it 'can be flipped', ->
    temp = card.get 'revealed'
    card.flip()
    assert.notEqual temp, card.get 'revealed'
