require 'game'

describe Game do
    subject(:game) {Game.new}

    describe "#initialzie" do
        it "creates the deck" do
            expect(game.deck).to be_a(Deck)
        end

        it "creates @players as an Array" do
            expect(game.players).to be_an(Array)
        end

        it "adds two Players to @players" do
            expect(game.players.length).to eq(2)
        end

        it "creates @pot as an Integer" do
            expect(game.pot).to be_an(Integer)
        end

        it "sets @pot to zero" do
            expect(game.pot).to eq(0)
        end
    end

    describe "game_over?" do
        it "returns false when more than one player has money" do
            expect(game.game_over?).to be false
        end

        it "returns true when only one player has money" do
            expect(game.game_over?).to be true
        end
    end
end