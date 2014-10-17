assert = chai.assert
expect = chai.expect

###
describe "deck constructor", ->

  it "should create a card collection", ->
    assert.strictEqual collection.length, 52
###

collection = new Deck()
describe "Score Handling", ->
  it "should give 2 scores when an ace is dealt", ->
    hand1 = new Hand([new Card({'rank':1}), new Card({'rank':0})])
    assert.strictEqual hand1.scores()[0], 11
    assert.strictEqual hand1.scores()[1], 21

describe "Basic hand rules", ->
  # Check to see if player score is working
  it "should be at least two", ->
    hand2 = collection.dealPlayer();
    expect(hand2.scores()[0]).to.be.above(2)

describe "Win possibilites", ->
describe "No busts", ->
  # generate hand with player score = 18 and dealer score = 17 make sure winner is player
  it "should evaluate player wins with no bust", ->
    game1 = new Game({'deck': collection})
    game1.set('playerHand', new Hand([new Card({'rank':8}), new Card({'rank':0})]))
    game1.set('dealerHand', new Hand([new Card({'rank':7}), new Card({'rank':0})]))
    assert.strictEqual game1.endGame(), 'player'

  it "should evaluate dealer wins with no bust", ->
    game2 = new Game({'deck': collection})
    game2.set('playerHand', new Hand([new Card({'rank':7}), new Card({'rank':0})]))
    game2.set('dealerHand', new Hand([new Card({'rank':8}), new Card({'rank':0})]))
    assert.strictEqual game2.endGame(), 'dealer'
describe "Busts", ->
  # Check for bust
  it "should check that player loses when over 21", ->
    game3 = new Game({'deck': collection})
    game3.set('playerHand', new Hand([new Card({'rank':10}), new Card({'rank': 10})], collection))
    game3.get('playerHand').hit()
    game3.get('playerHand').hit()
    assert.strictEqual game3.endGame(), 'dealer'

  it "should check that dealer loses when over 21", ->
    game3 = new Game({'deck': collection})
    game3.set('dealerHand', new Hand([new Card({'rank':10}), new Card({'rank': 10})], collection))
    game3.get('dealerHand').hit()
    game3.get('dealerHand').hit()
    assert.strictEqual game3.endGame(), 'player'

describe "Tie", ->
  it "should declare a tie when scores are equal", ->
    game1 = new Game({'deck': collection})
    game1.set('playerHand', new Hand([new Card({'rank':8}), new Card({'rank':0})]))
    game1.set('dealerHand', new Hand([new Card({'rank':8}), new Card({'rank':0})]))
    assert.strictEqual game1.endGame(), 'tie'

describe "Dealer behavior", ->
  # Check to see if dealer is hitting when under 17
  it "should have the dealer hit when his score is under 17", ->
    game1 = new Game({'deck': collection})
    game1.set('dealerHand', new Hand([new Card({'rank':6}), new Card({'rank':10})], collection))
    game1.dealerTurn()
    expect(game1.get('dealerHand').scores()[0]).to.be.above(17)

describe "Score checking with aces", ->
  # Check for ace handling
  it "should return the higher of two scores if both less than 21", ->
    game1 = new Game({'deck': collection})
    assert.strictEqual game1.handleAce([10,20]), 20

  it "should return the lower score if higher score is more than 21", ->
    game1 = new Game({'deck': collection})
    assert.strictEqual game1.handleAce([12,22]), 12


