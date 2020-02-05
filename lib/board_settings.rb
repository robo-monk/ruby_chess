module BoardSettings
  ABRV_HSH = {
    fs: "free space",

    wp:["w", "pawn"],
    wk:["w", "king"],
    wq:["w", "queen"],
    wr:["w", "rook"],
    wb:["w", "bishop"],
    wh:["w", "knight"],

    bp:["b", "pawn"],
    bk:["b", "king"],
    bq:["b", "queen"],
    br:["b", "rook"],
    bb:["b", "bishop"],
    bh:["b", "knight"]
  } 
  BOARD_DEFAULT_MATRIX = [
    [:wr, :wh, :wb, :wq, :wk, :wb, :wh, :wr],
    [:wp, :wp, :wp, :wp, :wp, :wp, :wp, :wp],
    [:fs, :fs, :fs, :fs, :fs, :fs, :fs, :fs],
    [:fs, :fs, :fs, :fs, :fs, :fs, :fs, :fs],
    [:fs, :fs, :fs, :fs, :fs, :fs, :fs, :fs],
    [:fs, :fs, :fs, :fs, :fs, :fs, :fs, :fs],
    [:bp, :bp, :bp, :bp, :bp, :bp, :bp, :bp],
    [:br, :bh, :bb, :bq, :bk, :bb, :bh, :br]
  ]
  MOVES_HASH = {
    # syntax MOVES_HASH(pawn.sprite/type)
    # -> [0]:dirs(empty if no res)/ 
    #    [1]:values(empty if no rest)
    #TODO fix diagonal movement restricion()
    pawn: [ [[0, 1], [1, 1], [-1, 1]] , [[0, 1], [0, 2], [1, 1]] ],
    king: [ [] , [[0, 1], [1, 0], [0, -1], [-1, 0], [1, 1], [-1, 1], [1, -1], [-1, -1]] ],
    queen: [ [], [:eq] ],
    bishop: [ [[1,1], [-1,1], [1,-1], [-1,-1]] , [:eq] ],
    rook: [ [[1,0], [-1,0], [0,1], [0,-1]] , [] ],
    knight: [ [], [ [2,1], [-2,1], [2,-1], [-2,-1], [1,2], [-1,2], [1,-2], [-1,-2]] ]
  }
  EMPTY_SPRITE = "·".gray
  BOARD_SQUARE_CODES = []
  BOARD_HERO = "         A  B  C  D  E  F  G  H  ".downcase.italic
  ANIMATION_TIME = 0.1
  def convert_to_xy(str)
    xy = str.split(//)
    xy[0].upcase!
    xy[1] = xy[1].to_i - 1
    xy[0] = xy[0].ord - 'A'.ord
    return xy
  end
end
