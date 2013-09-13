require 'spec_helper'

describe Yahtzee_score, "#score" do
  it "returns 1 for ONES with only one dice in one" do
    yahtzee_score = Yahtzee_score.new

    yahtzee_score.points(1,2,2,2,2).should eq (1)
  end


end