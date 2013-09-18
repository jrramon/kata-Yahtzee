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
		max_apps = counts_appearances(dices).sort_by { |dice, count| dice }
		max_apps.reverse.each {|dice, apps|
			return dice * 2 if apps >= 2
		} 
	end

	def counts_appearances(dices)
		counts = {0 => 0}
		counts[1] = dices.count{|die| die == 1 } 
		counts[2] = dices.count{|die| die == 2 } 
		counts[3] = dices.count{|die| die == 3 } 
		counts[4] = dices.count{|die| die == 4 } 
		counts[5] = dices.count{|die| die == 5 } 
		counts[6] = dices.count{|die| die == 6 } 
		counts
	end

end