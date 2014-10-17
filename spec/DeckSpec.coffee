assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it "should give the last card from the deck", ->
      assert.strictEqual deck.length, 50
      hand.hit()
      assert.strictEqual deck.length, 49
      hand.hit()
      hand.playable && (assert.strictEqual deck.length, 48)
