require './lib/board.rb'

describe Board do
  b = Board.new
  describe "#move" do
    it "renders board while doing the move" do
      expect(b.move("a2", "a4")).to eql("allow")
      expect(b.move("h2", "h4")).to eql("allow")

      # expect(b.move("a2", "a4")).to eql("empty space")
      expect(b.move('a1', 'a8')).to eq("allow")
      expect(b.move('h1', 'h8')).to eq("allow")
      expect(b.move('f1', 'b5')).to eq("allow")
      expect(b.move('c1', 'g5')).to eq("allow")
      expect(b.move('d7', 'd5')).to eq("allow")

      # expect(b.move('b1', 'c3')).to eq("allow")
      # expect(b.move('b1', 'c3')).to eq("allow")

      # expect(b.move("a4", "a7")).to eql("denied")
    end
  end
  # describe "#confirm_move" do
  #   it "finds direction" do
  #     expect(b.get_dir("a1", "a2")).to eql([0, 1])
  #     expect(b.get_dir("a1", "a1")).to eql([0, 0])
  #     expect(b.get_dir("b1", "a2")).to eql([-1, 1])
  #     expect(b.get_dir("a8", "a2")).to eql([0, -1])
  #     expect(b.get_dir("c1", "f2")).to eql([1, 1])
  #   end
  # end
  # describe "#allows_dir" do
  #   it "allows white pawn moves direction" do
  #     ppp = Pawn.new(["w", "pawn"])
  #     expect(b.allows_dir?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_dir?(ppp, "a1", "b1")).to eql(false)
  #     expect(b.allows_dir?(ppp, "a1", "b2")).to eql(true)
  #     expect(b.allows_dir?(ppp, "b1", "a2")).to eql(true)
  #   end
  #   it "allows black pawn moves direction" do
  #     ppp = Pawn.new(["b", "pawn"])
  #     expect(b.allows_dir?(ppp, "a1", "a2")).to eql(false)
  #     expect(b.allows_dir?(ppp, "a1", "b1")).to eql(false)
  #     expect(b.allows_dir?(ppp, "b2", "a1")).to eql(true)
  #     expect(b.allows_dir?(ppp, "b3", "a2")).to eql(true)
  #   end
  #   it "allows knight moves direction" do
  #     ppp = Pawn.new(["w", "knight"])
  #     expect(b.allows_dir?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_dir?(ppp, "a1", "b1")).to eql(true)
  #     expect(b.allows_dir?(ppp, "a1", "b2")).to eql(true)
  #     expect(b.allows_dir?(ppp, "b1", "a2")).to eql(true)
  #   end
  #   it "allows rook moves direction" do
      
  #     ppp = Pawn.new(["w", "rook"])
  #     expect(b.allows_dir?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_dir?(ppp, "a1", "b1")).to eql(true)
  #     expect(b.allows_dir?(ppp, "a1", "b2")).to eql(false)
  #     expect(b.allows_dir?(ppp, "b1", "a2")).to eql(false)
  #   end
  #   it "allows queen moves direction" do
      
  #     ppp = Pawn.new(["w", "queen"])
  #     expect(b.allows_dir?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_dir?(ppp, "a1", "b1")).to eql(true)
  #     expect(b.allows_dir?(ppp, "a1", "b2")).to eql(true)
  #     expect(b.allows_dir?(ppp, "b1", "a2")).to eql(true)
  #   end
  #   it "allows king moves direction" do
      
  #     ppp = Pawn.new(["w", "king"])
  #     expect(b.allows_dir?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_dir?(ppp, "a1", "b1")).to eql(true)
  #     expect(b.allows_dir?(ppp, "a1", "b2")).to eql(true)
  #     expect(b.allows_dir?(ppp, "b1", "a2")).to eql(true)
  #   end
  #   it "allows bishop moves direction" do
  #     ppp = Pawn.new(["w", "bishop"])
  #     expect(b.allows_dir?(ppp, "a1", "a2")).to eql(false)
  #     expect(b.allows_dir?(ppp, "a1", "b1")).to eql(false)
  #     expect(b.allows_dir?(ppp, "a1", "b2")).to eql(true)
  #     expect(b.allows_dir?(ppp, "b1", "a2")).to eql(true)
  #   end
  # end

  # describe "#allows_var" do
  #   it "allows pawn moves value" do
  #     ppp = Pawn.new(["w", "pawn"])
  #     expect(b.allows_val?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_val?(ppp, "a1", "a5")).to eql(false)
  #     expect(b.allows_val?(ppp, "a1", "b2")).to eql(true)
  #     expect(b.allows_val?(ppp, "b1", "a5")).to eql(false)
  #   end
  #   it "allows knight moves value" do
      
  #     ppp = Pawn.new(["w", "knight"])
  #     expect(b.allows_val?(ppp, "a1", "a2")).to eql(false)
  #     expect(b.allows_val?(ppp, "a1", "b1")).to eql(false)
  #     expect(b.allows_val?(ppp, "a1", "b3")).to eql(true)
  #     expect(b.allows_val?(ppp, "b1", "d2")).to eql(true)
  #   end
  #   it "allows rook moves value" do
      
  #     ppp = Pawn.new(["w", "rook"])
  #     expect(b.allows_val?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_val?(ppp, "a1", "b1")).to eql(true)
  #     expect(b.allows_val?(ppp, "b1", "b8")).to eql(true)
  #     expect(b.allows_val?(ppp, "a8", "a2")).to eql(true)
  #   end
  #   it "allows queen moves value" do
      
  #     ppp = Pawn.new(["w", "queen"])
  #     expect(b.allows_val?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_val?(ppp, "a1", "b1")).to eql(true)
  #     expect(b.allows_val?(ppp, "a1", "b2")).to eql(true)
  #     expect(b.allows_val?(ppp, "a1", "h8")).to eql(true)
  #     expect(b.allows_val?(ppp, "b1", "a2")).to eql(true)
  #   end
  #   it "allows king moves value" do
      
  #     ppp = Pawn.new(["w", "king"])
  #     expect(b.allows_val?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_val?(ppp, "a1", "b1")).to eql(true)
  #     expect(b.allows_val?(ppp, "a1", "b2")).to eql(true)
  #     expect(b.allows_val?(ppp, "b1", "a8")).to eql(false)
  #     expect(b.allows_val?(ppp, "a1", "a8")).to eql(false)
  #   end
  #   it "allows bishop moves value" do
      
  #     ppp = Pawn.new(["w", "bishop"])
  #     expect(b.allows_val?(ppp, "a1", "b2")).to eql(true)
  #     expect(b.allows_val?(ppp, "a1", "h8")).to eql(true)
  #   end
  # end
  # describe "#allows_move" do
  #   it "allows white pawn move" do
      
  #     ppp = Pawn.new(["w", "pawn"])
  #     expect(b.allows_move?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_move?(ppp, "a1", "a4")).to eql(false)
  #     expect(b.allows_move?(ppp, "a2", "a1")).to eql(false)
  #     expect(b.allows_move?(ppp, "a3", "a1")).to eql(false)
  #   end
  #   it "allows black pawn move" do
      
  #     ppp = Pawn.new(["b", "pawn"])
  #     expect(b.allows_move?(ppp, "a1", "a2")).to eql(false)
  #     expect(b.allows_move?(ppp, "a1", "a4")).to eql(false)
  #     expect(b.allows_move?(ppp, "a7", "a6")).to eql(true)
  #     expect(b.allows_move?(ppp, "a3", "a1")).to eql(true)
  #   end
  #   it "allows king move" do
      
  #     ppp = Pawn.new(["w", "king"])
  #     expect(b.allows_move?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_move?(ppp, "a1", "b3")).to eql(false)
  #     expect(b.allows_move?(ppp, "a1", "b2")).to eql(true)
  #   end
  #   it "allows rook move" do
      
  #     ppp = Pawn.new(["w", "rook"])
  #     expect(b.allows_move?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_move?(ppp, "a1", "b3")).to eql(false)
  #     expect(b.allows_move?(ppp, "a1", "b2")).to eql(false)
  #     expect(b.allows_move?(ppp, "a1", "a8")).to eql(true)
  #     expect(b.allows_move?(ppp, "a4", "h4")).to eql(true)
  #   end
  #   it "allows knight move" do
      
  #     ppp = Pawn.new(["w", "knight"])
  #     expect(b.allows_move?(ppp, "a1", "a2")).to eql(false)
  #     expect(b.allows_move?(ppp, "a1", "b3")).to eql(true)
  #     expect(b.allows_move?(ppp, "b3", "a1")).to eql(true)
  #     expect(b.allows_move?(ppp, "h1", "f2")).to eql(true)
  #     expect(b.allows_move?(ppp, "e1", "d3")).to eql(true)
  #     expect(b.allows_move?(ppp, "a1", "a8")).to eql(false)
  #     expect(b.allows_move?(ppp, "a4", "h4")).to eql(false)
  #   end
  #   it "allows queen move" do
      
  #     ppp = Pawn.new(["w", "queen"])
  #     expect(b.allows_move?(ppp, "a1", "a2")).to eql(true)
  #     expect(b.allows_move?(ppp, "a1", "b3")).to eql(false)
  #     expect(b.allows_move?(ppp, "b3", "a1")).to eql(false)
  #     expect(b.allows_move?(ppp, "e1", "d3")).to eql(false)
  #     expect(b.allows_move?(ppp, "a1", "d4")).to eql(true)
  #     expect(b.allows_move?(ppp, "a4", "h4")).to eql(true)
  #   end
  #    it "allows bishop move" do
      
  #     ppp = Pawn.new(["w", "bishop"])
  #     expect(b.allows_move?(ppp, "a1", "a2")).to eql(false)
  #     expect(b.allows_move?(ppp, "a1", "b3")).to eql(false)
  #     expect(b.allows_move?(ppp, "b3", "a1")).to eql(false)
  #     expect(b.allows_move?(ppp, "e1", "d3")).to eql(false)
  #     expect(b.allows_move?(ppp, "a1", "d4")).to eql(true)
  #     expect(b.allows_move?(ppp, "a4", "h4")).to eql(false)
  #   end
  # end
end