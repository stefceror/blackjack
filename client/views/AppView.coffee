class window.AppView extends Backbone.View

  template: _.template '
    <div class="game-div"></div>
  '

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.game-div').html new GameView(model: @model.get 'game').el
