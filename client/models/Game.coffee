class window.Game extends Backbone.Model

  initialize: (params) ->

    @set 'playerHand', params.deck.dealPlayer()
    @set 'dealerHand', params.deck.dealDealer()

    #listen for a 'stand' event from the player
    @listenTo (@get 'playerHand'), 'stand', @dealerTurn
    @listenTo (@get 'dealerHand'), 'stand', @endGame
    #Compare the player's hand value to dealer's hand value to determine winner according to the rules of blackjack

    @listenTo (@get 'playerHand'), 'bust', @endGame
    @listenTo (@get 'dealerHand'), 'bust', @endGame

  # Define endGame
  endGame: ->
    playerScore = (@get 'playerHand').scores()
    playerScore = @handleAce(playerScore)
    dealerScore = (@get 'dealerHand').scores()
    dealerScore = @handleAce(dealerScore)

    winner = @pickWinner playerScore, dealerScore
    @trigger winner

  handleAce: (score) ->
      if score.length is 2
        if score[1] > 21 then score[0]
        else score[1]
      else score

  pickWinner: (playerScore, dealerScore) ->
    winner = switch
      when playerScore > 21 and dealerScore > 21 then 'loss'
      when playerScore > 21 then 'dealer'
      when dealerScore > 21 then 'player'
      when playerScore > dealerScore then 'player'
      when dealerScore > playerScore then 'dealer'
      else 'tie'

  dealerTurn: ->
    (@get 'dealerHand').at(0).flip()
    (@get 'dealerHand').hit() until (@handleAce (@get 'dealerHand').scores()) >= 17
    if (@get 'dealerHand').scores()[0] <= 21
      @endGame.apply(@)
