require 'spec_helper'

describe Yahtzee_score, "#score" do
	let (:yahtzee_score) {Yahtzee_score.new}

	describe "for categories of numbers" do
		it "the sum for ONES" do
			yahtzee_score.points(:ones, [1,2,2,2,2]).should eq (1)
			yahtzee_score.points(:ones, [1,2,1,2,2]).should eq (2)
		end
		it "the sum for TWOS" do
			yahtzee_score.points(:twos, [1,2,1,2,2]).should eq (6)
			yahtzee_score.points(:twos, [1,2,1,2,5]).should eq (4)
		end
		it "the sum for THREES" do
			yahtzee_score.points(:threes, [1,2,1,3,2]).should eq (3)
			yahtzee_score.points(:threes, [1,2,1,3,3]).should eq (6)
		end
		it "the sum for FOURS" do
			yahtzee_score.points(:fours, [1,2,1,4,2]).should eq (4)
			yahtzee_score.points(:fours, [1,4,1,4,5]).should eq (8)
		end
		it "the sum for FIVES" do
			yahtzee_score.points(:fives, [1,2,1,2,5]).should eq (5)
			yahtzee_score.points(:fives, [1,5,1,2,5]).should eq (10)
		end
		it "the sum for SIXES" do
			yahtzee_score.points(:sixes, [1,6,1,2,2]).should eq (6)
			yahtzee_score.points(:sixes, [1,6,1,6,5]).should eq (12)
		end
	end
 

end