class Yahtzee_score

	def points(category, dices, n = nil)
		case category
			when :values
				return sum_of(dices, n)
			when :pairs
				return sum_of_highest_pair(dices)
			when :three
				return sum_of_highest_three_of_a_kind(dices)
			when :four
				return sum_of_highest_four_of_a_kind(dices)
			when :small_straight
				return small_straight(dices)
			when :large_straight
				return large_straight(dices)
			when :full_house
				return full_house(dices)
			when :yahtzee
				return yahtzee(dices)
		end
	end
 
	def sum_of(dices, n)
		dices.count{|die| die == n } * n
	end

	def sum_of_highest_pair(dices)
		sum_of_a_kind(dices, 2)
	end

	def sum_of_highest_three_of_a_kind(dices)
		sum_of_a_kind(dices, 3)
	end

	def sum_of_highest_four_of_a_kind(dices)
		sum_of_a_kind(dices, 4)
	end

	def small_straight(dices)
		straight(dices, (1..5))
	end

	def large_straight(dices)
		straight(dices, (2..6))
	end

	def yahtzee(dices)
		return 50 if counts_appearances(dices).values.include?(5)
		0
	end

	def straight(dices, range)
		range.each{|dice|
			return 0 if !dices.include? dice
		}
		range.inject(:+)
	end

	def full_house(dices)
		return dices.inject(:+) if counts_appearances(dices).value?(3) &&
									counts_appearances(dices).value?(2)
		0
	end

	def sum_of_a_kind(dices, n)
		counts_appearances_ordered_by_dice(dices).reverse.each {|dice, apps|
			return dice * n if apps >= n
		}
		0 
	end

	def counts_appearances_ordered_by_dice(dices)
		counts_appearances(dices).sort_by { |dice, count| dice }
	end

	def counts_appearances(dices)
		counts = {0 => 0}
		(1..6).each{|n|
			counts[n] = dices.count{|die| die == n } 
		}
		counts
	end

end