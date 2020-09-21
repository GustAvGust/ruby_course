class Node
	attr_reader :value, :next_node 
	attr_writer :value, :next_node

	def initialize(value)
		@value = value
		@next_node = nil
	end

	def <=>(second_node)
		# if self.value > second_node.value
		# 	return 1
		# elsif self.value < second_node.value
		# 	return -1
		# else
		# 	return 0
		# end
		self.value<=>second_node.value
	end

	def to_s
		@value.to_s
	end
end