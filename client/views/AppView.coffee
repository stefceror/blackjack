class window.AppView extends Backbone.View

  template: _.template '
    <button class="playAgain">Play Again</button>
    <div class="game-div"></div>
    <div class="playerScore">Your Wins: <%= playerWins %></div>
    <div class="dealerScore">Dealer Wins: <%= dealerWins %></div>
  '

  events:
    "click .playAgain": -> @model.playAgain()

  initialize: ->
    @render()
    @model.on 'change', => @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$('.game-div').html new GameView(model: @model.get 'game').el
