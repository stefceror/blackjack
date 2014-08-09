class window.AppView extends Backbone.View

  template: _.template '
    <button class="playAgain">Play Again</button>
    <div class="game-div"></div>
  '

  events:
    "click .playAgain": -> @model.playAgain()

  initialize: ->
    @render()
    @model.on 'change', => @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.game-div').html new GameView(model: @model.get 'game').el
