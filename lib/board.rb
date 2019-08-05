class Board
	attr_accessor :spaces

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
end