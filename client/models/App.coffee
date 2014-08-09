#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'game', game = new Game('deck': deck)
    #rules

  playAgain: ->
    @set 'game', game = new Game('deck': @get('deck'))
