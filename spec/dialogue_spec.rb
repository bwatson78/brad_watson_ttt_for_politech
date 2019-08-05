require "./lib/dialogue.rb"
require "spec_helper"

describe "Dialogue" do
	
	context ".begin" do 
		it "outputs the right diaglogue" do
			expect do 
				Dialogue.begin
			end.to output("Which player do you want to be? X or O?\n").to_stdout
		end
	end

	context ".try_again" do
		it "outputs the right diaglogue" do
			expect do 
				Dialogue.try_again
			end.to output("Invalid. Please choose X or O.\n").to_stdout
		end
	end

	context ".goodbye" do 
		it "outputs the right diaglogue" do
			expect do 
				Dialogue.goodbye
			end.to output("Thank you for playing.\n").to_stdout
		end
	end
end