require 'spec_helper'

describe Yahtzee_score, "#score" do
	let (:yahtzee_score) {Yahtzee_score.new}

	describe "for categories of numbers" do
		describe "the sum for ONES" do
			yahtzee_score.points(:ones, [1,2,2,2,2]).should eq (1)
		end
	end

end