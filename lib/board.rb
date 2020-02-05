require_relative 'pawn'
require_relative 'string'
require_relative 'board_settings'
class Board
  include BoardSettings
  include Comparable
  attr_accessor :sym_matrix, :obj_matrix
  def initialize
    @sym_matrix = BOARD_DEFAULT_MATRIX
    @obj_matrix = []
    build_board
    render
  end
  def build_board
    @obj_matrix = []
    @sym_matrix.each do |row|
      row_queue = []
      row.each do |sym|
        unless sym==:fs
          row_queue << Pawn.new(ABRV_HSH[sym])
        else
          row_queue << nil
        end
      end
      @obj_matrix << row_queue
    end
  end
  def render
    puts `clear`
    render_stack = []
    @obj_matrix.reverse.each_with_index do |row, i|
      render_queue = ""
      legend = "   #{@obj_matrix.length-i}    ".italic
      row.each do |pawn|
        unless pawn.nil?
          render_queue << " "+pawn.render+" "
        else
          render_queue << " "+EMPTY_SPRITE+" "
        end
      end
      puts legend + render_queue
      puts ""
    end
    puts BOARD_HERO + "\n\n"
  end
  def get_dir(from, to)
    dir_x = to[0]<=>from[0]
    dir_y = to[1]<=>from[1]
    return [dir_x, dir_y]
  end
  def get_val(from, to)
    val_x = -(from[0]-to[0])
    val_y = -(from[1]-to[1])
    return [val_x, val_y]
  end
  def allows_dir?(pawn, from, to)
    if pawn.col == 'w'
      dir = get_dir(from, to)
    else
      dir = get_dir(to, from)
    end
    moves_data = MOVES_HASH[pawn.sym]
    allowed_dir = moves_data[0]
    return true if allowed_dir.empty?
    return allowed_dir.any?(dir)
  end
  def allows_val?(pawn, from, to)
    if pawn.col == 'w'
      val = get_val(from, to)
    else
      val = get_val(to, from)
    end
    moves_data = MOVES_HASH[pawn.sym]
    allowed_val = moves_data[1]
    return true if allowed_val.empty?
    if allowed_val[0] == :eq
      return val[0].abs == val[1].abs if (val[0] != 0 && val[1] != 0)
      return true
    else
      return allowed_val.any?(val)
    end
  end
  def allows_move?(pawn, from, to)
    allows_dir?(pawn, from, to) && allows_val?(pawn, from, to)
  end
  def move_reccur(from, to)
    sleep(ANIMATION_TIME)
    pawn = @obj_matrix[from[1]][from[0]]
    if allows_move?(pawn, from, to)
      vec = get_dir(from, to)
      next_move = [from[0]+vec[0], from[1]+vec[1]]
      puts @sym_matrix[next_move[1]][next_move[0]]
      puts @sym_matrix[from[1]][from[0]]
      @sym_matrix[next_move[1]][next_move[0]] = @sym_matrix[from[1]][from[0]]
      @sym_matrix[from[1]][from[0]] = :fs
      build_board
      render
      move_reccur(next_move, to)
      pawn.initiated = true
      return "allow"
    else
      return "denied"
    end
  end
  def move(from_str, to_str)
    from = convert_to_xy(from_str)
    to = convert_to_xy(to_str)
    case @sym_matrix[from[1]][from[0]]
    when :fs
      move_reccur(from, to)
    when :wp, :bp
      puts "moving pawn"
      move_reccur(from, to)
    when :wr, :br
      puts "moving rook"
      move_reccur(from, to)
    when :wb, :bb
      puts "moving bishop"
      move_reccur(from, to)
    else
      'empty space'
    end
  end
end

# Board.new