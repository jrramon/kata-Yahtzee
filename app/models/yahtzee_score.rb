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