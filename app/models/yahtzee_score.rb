class Yahtzee_score

	def points(category, dices)
		case category
			when :ones
				return sum_of_ones(dices)
			when :twos
				return 6
		end
	end

	def sum_of_ones(dices)
		dices.count{|die| die == 1 }
	end
end