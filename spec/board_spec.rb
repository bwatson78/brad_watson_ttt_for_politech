require "./lib/board.rb"
require "spec_helper"

describe "Board" do

	context "::SPACE_TO_INDEX" do
		it "includes all space-index assignments" do
			expect(Board::SPACE_TO_INDEX).to include("a1" => 0)
			expect(Board::SPACE_TO_INDEX).to include("b1" => 1)
			expect(Board::SPACE_TO_INDEX).to include("c1" => 2)
			expect(Board::SPACE_TO_INDEX).to include("a2" => 3)
			expect(Board::SPACE_TO_INDEX).to include("b2" => 4)
			expect(Board::SPACE_TO_INDEX).to include("c2" => 5)
			expect(Board::SPACE_TO_INDEX).to include("a3" => 6)
			expect(Board::SPACE_TO_INDEX).to include("b3" => 7)
			expect(Board::SPACE_TO_INDEX).to include("c3" => 8)
		end
	end


	context "#initialize" do
		it "creates an instance of a board" do
			board = Board.new
			expect(board.spaces).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
		end
	end

	context "#show" do
		it "displays the board correctly" do
			board = Board.new
			expect do 
				board.show
			end.to output("      A   B   C\n    +---+---+---+\n1   |   |   |   |\n    +---+---+---+\n2   |   |   |   |\n    +---+---+---+\n3   |   |   |   |\n    +---+---+---+\n"	).to_stdout
		end
	end

	context "#place" do
		it "assigns the user piece to the designated space" do
			board = Board.new
			player = Human.new("X")
			board.place(player.piece, "a3")
			expect(board.spaces[6]).to eq("X")
		end
	end

end 