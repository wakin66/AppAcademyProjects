require 'set'
require_relative './player.rb'
require_relative './aiplayer.rb'

class Game
    def initialize
        @players = []
        @fragment = ""
        @dictionary = Set.new
        @losses = Hash.new(0)
        @idx = 0
    end

    def load_dictionary
        File.open("dictionary.txt").each {|str| @dictionary.add(str.chomp)}
    end

    def play_round
        round_over = false
        @fragment = ""
        display_standings
        puts "+++++"
        while !round_over
            round_over = take_turn(current_player)
        end
        puts "#{@fragment} is a word,"
        puts "which means #{previous_player.name} lost that round."
        puts "+++++"
        @losses[previous_player] += 1
    end

    def current_player
        @players[@idx]
    end

    def previous_player
        (@idx == 0) ? @players[-1] : @players[@idx-1]
    end

    def next_player!
        (@idx == @players.length - 1) ? (@idx = 0) : (@idx += 1)
    end

    def take_turn(player)
        move = ""
        if @losses[player] != 5
            until valid_play?(move)
                if player.is_ai?
                    move = AiPlayer.get_move(@fragment,@players.length)
                    puts "#{player.name}'s move is #{move.upcase}."
                else
                    move = player.get_move
                end
                puts "The move #{move.upcase} is not a valid move." if !valid_play?(move)
            end
            @fragment += move.downcase
            puts "The fragment is now: #{@fragment}"
            puts "+++++"
        end
        next_player!
        @dictionary.include?(@fragment)
    end

    def valid_play?(string)
        #make sure only one character was entered
        return false if string.length != 1
        letter = string.to_s.downcase
        alpha = "abcdefghijklmnopqrstuvwxyz"
        #make sure the character is in the alphabet
        return false if !alpha.include?(letter)
        load_dictionary if @dictionary.empty?
        #make sure at least one word in the dictionary starts with 
        @dictionary.any? {|word|  word.start_with?(@fragment+letter)}
    end

    def game_over?
        count = 0
        @losses.each {|k,v| count +=1 if v == 5}
        return true if count == @players.length - 1
        false
    end

    def record(player)
        print "#{player.name} currently has the following letters: "
        print "GHOST"[0..@losses[player]-1] if @losses[player] != 0
        puts
    end

    def display_standings
        @players.each {|player| record(player)}
    end

    def run
        print "How many total players?(Default 2)  "
        num_players = gets.chomp.to_i.abs
        num_players = 2 if num_players == 0
        print "how many bots?(Defaults to 1 human and the rest as bots)  "
        num_human = num_players - gets.chomp.to_i.abs
        num_human = 1 if (num_human == 0 || num_human >= num_players)
        num_players.times do |num|
            if num < num_human
                @players << Player.new(false,num)
            else
                @players << Player.new(true,num)
            end
        end
        puts "+++++"
        while !game_over?
            play_round
        end
        while @losses[current_player] == 5
            next_player!
        end
        puts "-----"
        puts "#{current_player.name} has won the game!"
    end
end

def new_game
    a = Game.new
    a.run
end