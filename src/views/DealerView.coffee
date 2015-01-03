class window.DealerView extends Backbone.View
  className: 'dealer'

  template: _.template '
    <div class="hand"></div>
  '

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.hand').html new HandView(collection: @model.get 'hand').el
