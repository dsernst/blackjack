assert = chai.assert

testGame = new App()
player = testGame.get('players').at(0)

describe 'player', ->

  spy = sinon.spy()

  it 'invoking Player.start(), triggers "deal me in"', ->
    temp = spy.callCount
    player.on('deal me in', spy)
    player.start()
    assert.equal spy.callCount, temp + 1

  it 'invoking Player.hit(), triggers "hit me"', ->
    temp = spy.callCount
    player.on('hit me', spy)
    player.hit()
    assert.equal spy.callCount, temp + 1
