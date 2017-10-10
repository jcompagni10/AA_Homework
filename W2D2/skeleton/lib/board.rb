require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @players = {name1 => 6, name2 => 13}
    @cups = Array.new(14) {[]}
    (0..13).each do |cup|
      @cups[cup] = [:stone] * 4 unless cup == 6 || cup == 13
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    unless start_pos.between?(0,12)
      raise "Invalid starting cup"
    end
    if @cups[start_pos].empty?
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    cup_idx = start_pos
    until stones.empty?
      cup_idx +=1
      if cup_idx == 6 || cup_idx == 13
        if @players[current_player_name] == cup_idx
          @cups[cup_idx % 14] << stones.pop
        end
      else
        @cups[cup_idx % 14] << stones.pop
      end
    end
    render
    next_turn(cup_idx % 14)
  end

  def next_turn(ending_cup_idx)
    end_cup = @cups[ending_cup_idx]
    if ending_cup_idx == 13 || ending_cup_idx == 6
      :prompt
    elsif end_cup.length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? {|cup| @cups[cup].empty?} ||
    (7..12).all? {|cup| @cups[cup].empty?}

  end

  def winner
    player1 = @cups[6]
    player2 = @cups[13]

    case player1 <=> player2
    when -1
      return @player2
    when 0
      return :draw
    when 1
      return @player1
    end
  end
end
