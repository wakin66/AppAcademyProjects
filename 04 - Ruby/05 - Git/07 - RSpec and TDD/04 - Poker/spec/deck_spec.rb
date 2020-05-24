require 'deck'

describe Deck do
    let(:card) {double("Card")}
    subject(:deck) {Deck.new}

    context "with a new deck" do
        describe "#initialize" do
            it "fills @cards with 52 cards" do
                expect(deck.size).to eq(52)
            end
        end
    end

    describe "#draw_card" do
        it "removes a card from the deck" do
            deck.draw_card
            expect(deck.size).to eq(51)
        end

        it "returns the card removed from the deck" do
            expect(deck.draw_card.class).to eq(Card)
        end
    end

    describe "#shuffle" do
        it "doesn't add or remove cards" do
            deck_length = deck.size
            deck.shuffle
            expect(deck.size).to eq(deck_length)
        end
    end

    describe "#size" do
        it "returns the length of the @cards array" do
            expect(deck.size).to eq(52)
        end
    end

end