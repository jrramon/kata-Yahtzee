class Yahtzee_score

	def points(category, dices)
		case category
			when :ones
				return sum_of(dices, 1)
			when :twos
				return sum_of(dices, 2)
			when :threes
				return sum_of(dices, 3)
			when :fours
				return sum_of(dices, 4)
			when :fives
				return sum_of(dices, 5)
			when :sixes
				return sum_of(dices, 6)
		end
	end
 
	def sum_of(dices, n)
		dices.count{|die| die == n } * n
	end

end