assert = chai.assert

testGameView = new AppView model: new App()
turn = -> testGameView.model.get 'turn'
playerHand = testGameView.model.get('players').at(0).get 'hand'

describe 'game controls', ->
  it 'if user clicks stand, turn ends', ->
    temp = turn()
    testGameView.trigger 'click .standbutton'
    assert.equal turn(), temp + 1

  it 'if user clicks hit, invoke Hand.hit()', ->
    temp = playerHand.length
    testGameView.trigger 'click .hitbutton'
    assert.equal playerHand.length, temp + 1
