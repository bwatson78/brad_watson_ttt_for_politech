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
	    @player_1 = player_1
	    @player_2 = player_2
	    @board = Board.new
	end

	def current_player
		@board.turn_count % 2 == 0 ? @player_1 : @player_2
	end

	def won? 
		reply = false
		WINNING_COMBOS.each do |combo|
			space_1 = @board.spaces[combo[0]]
			space_2 = @board.spaces[combo[1]]
			space_3 = @board.spaces[combo[2]]
			win = [space_1, space_2, space_3].uniq.size == 1 && space_1 != " "
			reply = combo if win
		end
		reply
	end

	def draw?
		!won? && @board.full?
	end

	def over?
		!!won? || draw? || @board.full?
	end

	def winner
		win_combo = won?
		if win_combo.kind_of?(Array)
			@board.spaces[win_combo[0]] == @player_1.piece ? @player_1 : @player_2
		else
			return nil
		end
	end

	def turn
		current_move = current_player.move(@board)
		if !@board.valid_move?(current_move)
			Dialogue.move_invalid 
			turn
		else
			@board.place(current_player.piece, current_move)
			@board.show
		end
	end

	def play
		@board.show
		turn until over?
		Dialogue.declare_winner(winner.piece) if won?
		Dialogue.declare_draw if draw?
	end

end