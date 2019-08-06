class Dialogue

	def self.begin
		puts "Which player do you want to be? X or O?"
	end

	def self.try_again
		puts "Invalid. Please choose X or O."
	end

	def self.goodbye
		puts "Thank you for playing."
	end

	def self.ask_for_move
		puts "Please enter desired space(e.g., A1 or b3):"
	end

	def self.move_invalid
		puts "Invalid choice. Choose empty square."
	end

	def self.declare_winner(piece)
		puts "#{piece} has won!"
	end

	def self.declare_draw
		puts "Game ends in draw!"
	end
end