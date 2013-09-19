require 'spec_helper'

describe Yahtzee_score, "#score" do
	let (:yahtzee_score) {Yahtzee_score.new}

	describe "for categories of numbers" do
		it "the sum for VALUES" do
			yahtzee_score.points(:values, [1,2,2,2,2], 1).should eq (1)
			yahtzee_score.points(:values, [1,2,1,2,2], 1).should eq (2)
			yahtzee_score.points(:values, [1,2,1,2,2], 2).should eq (6)
			yahtzee_score.points(:values, [1,2,1,2,5], 2).should eq (4)
			yahtzee_score.points(:values, [1,2,1,3,2], 3).should eq (3)
			yahtzee_score.points(:values, [1,2,1,3,3], 3).should eq (6)
			yahtzee_score.points(:values, [1,2,1,4,2], 4).should eq (4)
			yahtzee_score.points(:values, [1,4,1,4,5], 4).should eq (8)
			yahtzee_score.points(:values, [1,2,1,2,5], 5).should eq (5)
			yahtzee_score.points(:values, [1,5,1,2,5], 5).should eq (10)
			yahtzee_score.points(:values, [1,6,1,2,2], 6).should eq (6)
			yahtzee_score.points(:values, [1,6,1,6,5], 6).should eq (12)
		end
	end

	describe "for pairs" do
		it "there are some pairs" do
			yahtzee_score.points(:pairs, [3,3,3,4,4]).should eq (8)
			yahtzee_score.points(:pairs, [3,6,6,4,4]).should eq (12)
		end

		it "there are NO pairs" do
			yahtzee_score.points(:pairs, [1,2,3,4,5]).should eq (0)
		end

	end

	describe "for three of a kind" do
		it "there are some pairs" do
			yahtzee_score.points(:three, [3,3,3,4,4]).should eq (9)
			yahtzee_score.points(:three, [4,6,6,4,4]).should eq (12)
		end
	end

	describe "four of a kind" do
		it "there are some pairs" do
			yahtzee_score.points(:four, [3,3,3,3,4]).should eq (12)
			yahtzee_score.points(:four, [4,2,2,2,2]).should eq (8)
		end
	end

	describe "Small straight" do
		it "Small straight" do
			yahtzee_score.points(:small_straight, [1,2,3,4,5]).should eq (15)
			yahtzee_score.points(:small_straight, [1,2,5,4,3]).should eq (15)
		end

		it "no small" do
			yahtzee_score.points(:small_straight, [1,2,3,2,5]).should eq (0)
		end
	end

	describe "Large straight" do
		it "Large straight" do
			yahtzee_score.points(:large_straight, [2,3,4,5,6]).should eq (20)
			yahtzee_score.points(:large_straight, [6,5,4,3,2]).should eq (20)
		end

		it "no Large" do
			yahtzee_score.points(:large_straight, [2,3,2,5,6]).should eq (0)
		end
	end
	
	describe "Full house" do
		it "Full house" do
			yahtzee_score.points(:full_house, [1,1,2,2,2]).should eq (8)
		end
		it "no Full house" do
			yahtzee_score.points(:full_house, [4,4,4,4,4]).should eq (0)
			yahtzee_score.points(:full_house, [4,4,4,2,4]).should eq (0)
		end
	end

	describe "Yahtzee" do
		it "Yahtzee" do
			yahtzee_score.points(:yahtzee, [2,2,2,2,2]).should eq (50)
		end
		it "no Yahtzee" do
			yahtzee_score.points(:yahtzee, [2,3,2,2,2]).should eq (0)
		end
	end
 

end