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
		(1..6).each{|n|
			counts[n] = dices.count{|die| die == n } 
		}
		counts
	end

end