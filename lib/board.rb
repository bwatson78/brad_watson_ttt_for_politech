class Board
	attr_accessor :spaces

	SPACE_TO_INDEX = {
		"a1" => 0, 
		"b1" => 1,
		"c1" => 2,
		"a2" => 3, 
		"b2" => 4,
		"c2" => 5,
		"a3" => 6, 
		"b3" => 7,
		"c3" => 8
	}

	def clean_board
		@spaces = Array.new(9, " ")
	end

	def initialize
		clean_board
	end

	def show
		puts "      A   B   C"
		puts "    +---+---+---+"
		puts "1   | #{@spaces[0]} | #{@spaces[1]} | #{@spaces[2]} |"
		puts "    +---+---+---+"
		puts "2   | #{@spaces[3]} | #{@spaces[4]} | #{@spaces[5]} |"
		puts "    +---+---+---+"
		puts "3   | #{@spaces[6]} | #{@spaces[7]} | #{@spaces[8]} |"
		puts "    +---+---+---+"
	end

	def place(piece, space)
		@spaces[SPACE_TO_INDEX[space]] = piece
	end
end