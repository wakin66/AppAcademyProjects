class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = Integer(1)
    @game_over = false
    @seq = Array.new
  end

  def play
    while !game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each.with_index do |color,idx|
      print color
      print " => " if (idx+1) != sequence_length
    end
    puts
  end

  def require_sequence

  end

  def add_random_color
    seq << COLORS[rand(COLORS.length)]
  end

  def round_success_message
    puts "You did it! Next round..."
  end

  def game_over_message
    puts "Congratulations, you survived for #{sequence_length} turns"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    seq.clear
  end
end
