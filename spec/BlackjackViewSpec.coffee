assert = chai.assert

###
describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52
###

describe "Score Handling", ->
  it "should handle Aces correctly", ->
    hand1 = new Hand([1, 0])
    console.log hand1
    assert.strictEqual hand1.scores()[0], 3
    assert.strictEqual hand1.scores()[1], 13


  # Check to see if player score is working

  # Check to see if dealer is hitting when under 17

  # Check for ace handling

