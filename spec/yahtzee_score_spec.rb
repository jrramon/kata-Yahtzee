require 'spec_helper'

describe Yahtzee_score, "#score" do
	let (:yahtzee_score) {Yahtzee_score.new}

	describe "for categories of numbers" do
		it "the sum for ONES" do
			yahtzee_score.points(:ones, [1,2,2,2,2]).should eq (1)
		end
		it "the sum for TWOS" do
			yahtzee_score.points(:twos, [1,2,1,2,2]).should eq (6)
		end
	end


end