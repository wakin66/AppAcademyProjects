require 'hand'

describe Hand do
    let(:card) {double("Card",:value => :Ace)}
    let(:deck) {double("Deck",:draw_card => card)}
    subject(:hand) {Hand.new(deck)}

    before(:each) {allow(card).to receive(:suit).and_return(:Spades,:Clubs,:Diamonds,:Hearts)}

    describe "#initialize" do
        it "creates @cards as an array" do
            expect(hand.cards).to be_an(Array)
        end

        it "adds five cards to @cards" do
            expect(hand.cards.length).to eq(5)
        end

        it "creates @hand as a symbol" do
            expect(hand.hand).to be_a(Symbol)
        end
    end

    describe "#exchange_cards" do
        context "when exchanging 2 cards" do
            it "calls Deck#draw_card twice" do
                hand.exchange_cards([1,2])
                expect(deck).to receive(:draw_card).twice
            end
        end

        context "when exchanging 3 cards" do
            it "calls Deck#draw_card three times" do
                expect(deck).to receive(:draw_card).exactly(3).times
            end
        end
    end

    describe "#compare_hands" do
        it "takes two symbols as arguments" do
            expect {hand.compare_hands(:Four_of_a_Kind,:Flush)}.to_not raise_exception
        end

        it "returns the hand with the highest value" do
            expect(hand.compare_hands(:Four_of_a_Kind,:Flush)).to eq(:Four_of_a_Kind)
        end
    end
end