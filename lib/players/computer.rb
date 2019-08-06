require "./lib/player.rb"
class Computer < Player

	def move(board)
		move = nil

		if !board.taken?("B2")
			move = "B2"
		elsif board.turn_count == 1
			move = "A1"
		elsif board.turn_count == 2
        	move = %w{A1 A3 C1 C3}.detect{|space| !board.taken?(space)}
		elsif board.turn_count == 3 && (board.taken?("A1") && board.taken?("C3") || board.taken?("A3") && board.taken?("C1"))
        	move = "A2"
        else
        	Game::WINNING_COMBOS.detect do |combo|

          		if combo.select{|i| board.spaces[i] == piece}.size == 2 && combo.any?{|i| board.spaces[i] == " "}
            		move = Board::SPACE_TO_INDEX.key(combo.select{|i| !board.taken?(i)}.first)
          		elsif combo.select{|i| board.spaces[i] != " " && board.spaces[i] != piece}.size == 2 && combo.any?{|i| board.spaces[i] == " "}
            		move = Board::SPACE_TO_INDEX.key(combo.select{|i| !board.taken?(i)}.first)
          		end
        	end
       		move = Board.space_keys.detect{|space| !board.taken?(space)} if move == nil
		end
		move
	end
end