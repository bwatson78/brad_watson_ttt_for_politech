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

	def initialize
		@spaces = Array.new(9, " ")
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
		@spaces[Board.space_index(space)] = piece
	end

	def self.space_index(space)
		SPACE_TO_INDEX[space.downcase]
	end

	def space_value(space)
		@spaces[Board.space_index(space)]
	end

	def self.space_keys
		SPACE_TO_INDEX.keys
	end

	def valid_move?(space)	
		return false if !(Board.space_keys.include?(space.downcase))
		!taken?(space)
	end

	def turn_count
		@spaces.count{|piece| piece == "X" || piece == "O"}
	end

	def full?
		turn_count == 9	
	end

	def taken?(space)
		result = space.is_a?(Integer) ? @spaces[space] : space_value(space)
		(result == "X" || result == "O") ? true : false
	end
end