require "./lib/player.rb"
class Human < Player

	def move(board)
		Dialogue.ask_for_move
		move = gets.strip
	end

end