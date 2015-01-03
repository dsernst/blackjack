class window.Card extends Backbone.Model
  initialize: (value) ->
    rank = value % 13
    suit = Math.floor(value / 13)
    @set
      revealed: true
      value: if rank is 0 or rank > 10 then 10 else rank
      suitName: ['Spades', 'Diamonds', 'Clubs', 'Hearts'][suit]
      rankName: switch rank
        when 0 then 'King'
        when 1 then 'Ace'
        when 11 then 'Jack'
        when 12 then 'Queen'
        else rank

  flip: ->
    @set 'revealed', !@get 'revealed'
    @

