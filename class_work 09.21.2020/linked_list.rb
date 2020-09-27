require_relative "node"

class Linked_list
	include Enumerable
	attr_reader :head, :tail 
	attr_writer :head, :tail

	def initialize(head)
		@head = head
		@tail = head
	end

	def each
		node = self.head
		while node != nil
			yield(node)
			node = node.next_node
		end
	end

	def add(node)
		@tail.next_node = node
		@tail = node
	end

	def to_s
		str = ""
		self.each do |node|
			str += node.value.to_s + " "
		end
		#reduce
		str
	end

	def [](n)
		node = @head
		(n - 1).times do
			node = node.next_node()
		end
		return node
	end

	def []=(n, value)
		self[n].value = value
	end
end

hd = Node.new(14)
ls = Linked_list.new(hd)
ls.add(Node.new(9))
ls.add(Node.new(11))
puts(ls)

puts(ls.max)
puts(ls.min)
puts(ls.sort)

puts(ls[2])
ls[2] = 44
puts(ls)