require 'player'

describe Player do
    let(:card) {double("Card",:value => :Ace, :suit => :Spades)}
    let(:deck) {double("Deck",:draw_card => card)}
    let(:hand) {double("Hand")}
    subject(:player) {Player.new(deck,50)}

    describe "#initialize" do
        it "takes a Deck as a parameter" do
            expect {Player.new(deck,50)}.to_not raise_exception
        end
    end
end