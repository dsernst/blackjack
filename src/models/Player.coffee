class window.Player extends Backbone.Model
  initialize: (@hand) ->
    @set
      outcome: null

  start: ->
    @trigger 'deal me in'

  hit: ->
    @trigger 'hit me'
