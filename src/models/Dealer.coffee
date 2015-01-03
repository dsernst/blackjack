class window.Dealer extends Backbone.Model
  initialize: ->
    @on
      'deal me in': deck.dealPlayer()

