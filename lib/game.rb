class Game

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

	def initialize(player_1, player_2, board)
	    @player_1 = player_1
	    @player_2 = player_2
	    @board = board
	end

end