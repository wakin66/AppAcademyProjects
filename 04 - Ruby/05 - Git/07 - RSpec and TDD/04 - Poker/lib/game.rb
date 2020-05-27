require_relative 'player'
require_relative 'deck'

class Game
    attr_reader :deck, :players, :pot

    def initialize
        @deck = Deck.new
        @players = Array.new
        create_players
        @pot = 0
    end

    def game_over?
        players.one? {|player| player.pot > 0} ? (return true) : (return false)
    end

    def switch_player
        players.push(players.shift)
    end

    def create_players
        2.times {players << Player.new(deck,50)}
    end
end