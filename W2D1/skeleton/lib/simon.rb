class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq= []

  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !@game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def seq_to_s
    @seq.join(' ')
  end

  def show_sequence
    system("clear")
    add_random_color
    puts "Simon Says: #{seq_to_s}"
    sleep(@sequence_length * 0.5)
    system("clear")
  end

  def require_sequence
    puts "Your Turn"
    idx = 0
    until (idx == sequence_length) || @game_over
      color = prompt_color(idx)
      @game_over = color != @seq[idx]
      idx += 1
    end
  end

  def prompt_color(n)
    print "#{n}: "
    gets.chomp
  end

  def add_random_color
    @seq << COLORS[rand(4)]

  end

  def round_success_message
    puts "CORRECT"
    sleep(1)

  end

  def game_over_message
    puts "GAME OVER!!"
    puts "Score: #{@sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq= []
  end
end
