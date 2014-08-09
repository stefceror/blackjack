#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'game', game = new Game('deck': deck)
    @set 'dealerWins', 0
    @set 'playerWins', 0
    #rules

    @listenTo (@get 'game'), 'player', @playerWin
    @listenTo (@get 'game'), 'dealer', @dealerWin

  playAgain: ->
    if (@get 'deck').length < 8 then @set 'deck', deck = new Deck()
    @set 'game', game = new Game('deck': @get('deck'))
    @listenTo (@get 'game'), 'player', @playerWin
    @listenTo (@get 'game'), 'dealer', @dealerWin


  playerWin: ->
    @set 'playerWins', wins = (@get 'playerWins') + 1

  dealerWin: ->
    @set 'dealerWins', wins = (@get 'dealerWins') + 1
