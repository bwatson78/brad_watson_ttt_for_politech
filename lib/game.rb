class Game

	attr_accessor :player_1, :player_2, :board

	WINNING_COMBOS = [
		[0,1,2],
	    [3,4,5],
	    [6,7,8],
	    [0,3,6],
	    [1,4,7],
	    [2,5,8],
	    [2,4,6],
	    [0,4,8]
	]

	def initialize(player_1, player_2)
	    @player_1 = Human.new(player_1)
	    @player_2 = Computer.new(player_2)
	    @board = Board.new
	end

	def play

	end

end