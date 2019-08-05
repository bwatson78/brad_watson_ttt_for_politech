class Board
	attr_accessor :spaces

	def clean_board
		@spaces = Array.new(9, "")
	end

	def initialize
		clean_board
	end
end