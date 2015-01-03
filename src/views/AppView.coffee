class window.AppView extends Backbone.View
  template: _.template '
    <div class="players-container"></div>
    <div class="dealer-container"></div>
  '

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.players-container').html new PlayersView(collection: @model.get 'players').el
    @$('.dealer-container').html new DealerView(model: @model.get 'dealer').el

