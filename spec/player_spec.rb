require "./lib/player.rb"
require "spec_helper"

describe "Player" do 
	before(:each) do 
		@player = Player.new("X")
	end
	context "#initialize" do
		it "creates an instance of player" do
			expect(@player.piece).to eq("X")
		end
	end

	context "#piece" do
		it "cannot be changed" do 
			expect{@player.piece = "O"}.to raise_error(NoMethodError)
			expect(@player.piece).to eq("X")
 		end
	end
end