require 'colorize'
require 'Set'

class WordChainer

    def initialize(dictionary_file_name, command_line = false)
        @dictionary = read_file(dictionary_file_name)
        @command_line = command_line
    end

    def read_file(filename)
        puts "Loading dictionary..."
        dictionary = Set.new
        File.open(filename).each_line do |word|
            dictionary << word.chomp
        end
        return dictionary
    end

    def adjacent_words(word)
        words = Array.new
        alpha = "abcdefghijklmnopqrstuvwxyz"
        (0..word.length-1).each do |idx|
            alpha.each_char do |char|
                new_word = word.dup
                new_word[idx] = char
                words << new_word if @dictionary.include?(new_word) && new_word[idx] != word[idx]
            end
        end
        return words
    end

    def explore_current_words
        new_current_words = Set.new
        @current_words.each do |word|
            adjacent_words(word).each do |adjacent|
                if !@all_seen_words.include?(adjacent)
                    new_current_words << adjacent
                    @all_seen_words[adjacent] = word
                end
            end
        end
        print_seen_words if !@command_line    #Can be removed
        return new_current_words
    end

    def print_seen_words #Can be removed when printing this list isn't needed.
        print "New Current Word pairs: "
        @current_words.each do |word|
            print "#{word} => #{@all_seen_words[word]}".blue+" : "
        end
        2.times {puts ""}
    end

    def build_path(target)
        puts "Building chain..."
        next_word = target
        chain = Array.new
        while next_word != nil
            chain << next_word
            next_word = @all_seen_words[next_word]
        end
        return chain
    end

    def include?(word)
        @dictionary.include?(word)
    end

    def run(source,target)
        @current_words = Set.new [source]
        @all_seen_words = {source => nil}
        while !@current_words.empty? && !@all_seen_words.include?(target)
            @current_words = explore_current_words
        end
        return build_path(target).reverse
    end

end

if __FILE__ == $PROGRAM_NAME
    dictionary = "dictionary.txt"
    if ARGV[0] == "-c"
        system("clear")
        ARGV.shift
    end
    if ARGV[0] == "-d"
        ARGV.shift
        dictionary = ARGV.shift
    end
    chain = WordChainer.new(dictionary,true)
    if ARGV.size == 2
        source = ARGV[0].strip.downcase
        target = ARGV[1].strip.downcase
    else
        print "What word do you want to start with? "
        source = gets.chomp
        while !chain.include?(source)
            puts ""
            puts "Please choose a word that is in the dictionary."
            print "What word do you want to start with?"
        end
        print "What word do you want to end with? "
        target = gets.chomp
        while !chain.include?(target) || source.length != target.length
            puts ""
            puts "Please choose a word that is in the dictionary."
            print "What word do you want to end with?"
        end
    end
    puts chain.run(source,target)
    sleep(5)
end