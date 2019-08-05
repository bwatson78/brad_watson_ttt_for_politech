require "./lib/dialogue.rb"
require "spec_helper"

describe "Dialogue" do
	
	context ".begin" do 
		it "outpus the right diaglogue" do
			expect(Dialogue.begin).to output("Which player do you want to be? X or O?").to_stdout
		end
	end
end