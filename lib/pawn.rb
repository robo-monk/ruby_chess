require_relative 'pawn_settings'
require_relative 'string'

class Pawn
  include PawnSettings
  attr_accessor :sprite, :col, :mv, :sym, :initiated
  def initialize ary
    @initiated = false
    @mv = 0
    str = ary[1]
    col = ary[0]
    @sym = str.to_sym
    if col == 'w'
      @col = 'w'
      @sprite = WHITE_SPRITES_HASH[@sym]
    else
      @col = 'b'
      @sprite = BLACK_SPRITES_HASH[@sym]
    end
  end
  def render
    if @col == "b"
      @sprite.red
    else
      @sprite
    end
  end

end
