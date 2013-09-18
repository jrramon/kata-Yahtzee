class Yahtzee_score

	def points(category, dices, n = nil)
		case category
			when :values
				return sum_of(dices, n)
			when :pairs
				return sum_of_highest_pair(dices)
		end
	end
 
	def sum_of(dices, n)
		dices.count{|die| die == n } * n
	end

	def sum_of_highest_pair(dices)
		counts_appearances_ordered_by_dice(dices).reverse.each {|dice, apps|
			return dice * 2 if apps >= 2
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