class Yahtzee_score

	def points(category, dices)
		case category
			when :ones
				return 1
			when :twos
				return 6
		end
	end
end