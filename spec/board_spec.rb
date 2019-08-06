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
	before(:each) do 
		@board = Board.new
	end

	context "#initialize" do
		it "creates an instance of a board" do
			expect(@board.spaces).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
		end
	end

	context "#show" do
		it "displays the board correctly" do
			expect do 
				@board.show
			end.to output("      A   B   C\n    +---+---+---+\n1   |   |   |   |\n    +---+---+---+\n2   |   |   |   |\n    +---+---+---+\n3   |   |   |   |\n    +---+---+---+\n"	).to_stdout
		end
	end

	context "#place" do
		it "assigns the user piece to the designated space" do
			player = Human.new("X")
			@board.place(player.piece, "a3")
			expect(@board.spaces[6]).to eq("X")
		end
	end

	context ".space_index" do 
		it "returns the index when provided with the two character space (uppercase)" do
			expect(Board.space_index("B2")).to eq(4)
		end

		it "returns the index when provided with the two character space (lowercase)" do
			expect(Board.space_index("a2")).to eq(3)
		end
	end

	context "#space_value" do
		it "returns the value of the indicated space" do
			@board.place("O", "B3")
			expect(@board.space_value("B3")).to eq("O")
		end
	end

	context ".space_keys" do
		it "returns an array of space keys" do
			expect(Board.space_keys).to eq(%w{a1 b1 c1 a2 b2 c2 a3 b3 c3})
		end
	end

	context "#valid_move?" do
		it "returns false when space is taken" do
			@board.place("X", "A2")
			expect(@board.valid_move?("A2")).to eq(false)
		end

		it "return true when space is empty" do
			@board.spaces[2] = " "
			expect(@board.valid_move?("A3")).to eq(true)
		end
	end

	context "#turn_count" do
		it "returns the right amount of turns" do
			@board.spaces = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
			expect(@board.turn_count).to eq(3)
		end
	end

	context "#full?" do
		it "returns true if all spaces taken" do
			@board.spaces = ["X", "X", "X", "O", "O", "O", "X", "X", "X"]
			expect(@board.full?).to eq(true)
		end

		it "returns false if not all spaces taken" do 
			@board.spaces = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
			expect(@board.full?).to eq(false)
		end
	end

end 