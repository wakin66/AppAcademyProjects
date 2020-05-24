require 'deck'

describe Deck do
    let(:card) {double("card")}
    subject(:deck) {Deck.new}

    context "with a new deck" do
        describe "#initialize" do
            it "creates @cards as array"

            it "fills @cards with cards"

            it "fills @cards with 52 cards"
        end
    end

    describe "#draw_card" do
        it "removes the top card from the deck"

        it "returns the top card from the deck"
    end

    describe "#shuffle" do
        before(:each) {deck.shuffle}
        it "reorders the @cards array"

        it "doesn't add or remove cards"
    end

end