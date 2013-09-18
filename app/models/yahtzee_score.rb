class Yahtzee_score

	def points(category, dices, n = nil)
		case category
			when :values
				return sum_of(dices, n)
		end
	end
 
	def sum_of(dices, n)
		dices.count{|die| die == n } * n
	end

end