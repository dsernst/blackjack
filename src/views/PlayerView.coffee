class window.PlayerView extends Backbone.View
  className: 'player'

  template: _.template '
    <button class="hit-button">Hit</button>
    <button class="stand-button">Stand</button>
    <div class="hand"></div>
  '

  events:
    'click .hit-button': -> @model.hit()
    'click .stand-button': -> @model.stand()

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.hand').html new HandView(collection: @model.get 'hand').el
