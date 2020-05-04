class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    place_stones
    @player1 = name1
    @player2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_index do |idx|
      4.times do 
        cups[idx] << :stone unless idx == 6 || idx == 13
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(0..13).include?(start_pos)
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    num_stones = cups[start_pos].count
    cups[start_pos] = Array.new
    idx = start_pos
    other_player_cup = current_player_name == @player1 ? 13 : 6
    while num_stones > 0
      idx = idx == 13 ? idx-13 : idx+1
      if idx != other_player_cup
        cups[idx] << :stone
        num_stones -= 1
      end
    end
    render
    return next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    cups[ending_cup_idx].count == 1 ? :switch : ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|cup| cup.empty?} || cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    if cups[6].count > cups[13].count
      return @player1
    elsif cups[6].count < cups[13].count
      return @player2
    else
      return :draw
    end
  end
end
