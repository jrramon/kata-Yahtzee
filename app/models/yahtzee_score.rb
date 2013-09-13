class Yahtzee_score

	def points(category, dices)
		case category
			when :ones
				return sum_of(dices, 1)
			when :twos
				return sum_of(dices, 2)
		end
	end

	def sum_of(dices, n)
		dices.count{|die| die == n } * n
	end

end