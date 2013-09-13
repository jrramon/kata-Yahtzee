class Yahtzee_score

	def points(category, dices)
		case category
			when :ones
				return sum_of_ones(dices)
			when :twos
				return sum_of_twos(dices)
		end
	end

	def sum_of_ones(dices)
		dices.count{|die| die == 1 }
	end

	def sum_of_twos(dices)
		dices.count{|die| die == 2 } * 2
	end
end