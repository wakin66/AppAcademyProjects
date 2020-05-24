require 'card'

describe Card do
    subject(:card) {Card.new(:six,:spade)}

    describe "#initialize" do
        context "takes two symbols as arguments" do
            it "doesn't throw an error when given two symbols" do
                expect {Card.new(:six,:spade)}.to_not raise_error(ArgumentError)
            end

            it "creates @suit as a symbol" do
                expect(card.suit).to be_a(Symbol)
            end

            it "creates @value as a symbol" do
                expect(card.value).to be_a(Symbol)
            end
        end

        context "receives a non-symbol argument" do
            it "raises an ArgumentError on first argument" do
                expect {Card.new("six",:spade)}.to raise_error(ArgumentError,"Invalid card value")
            end

            it "raises an ArgumentError on second argument" do
                expect {Card.new(:six,"spade")}.to raise_error(ArgumentError,"Invalid card suit")
            end
        end
    end

    describe "#to_s" do
        it "returns returns a string" do
            expect(card.to_s).to be_a(String)
        end

        it "returns the value and suit" do
            expect(card.to_s).to eq("6S")
        end
    end
end