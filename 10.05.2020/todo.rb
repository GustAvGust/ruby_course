class ToDo
	attr_accessor :id, :title

	def initialize(title)
		@id = nil
		@title = title
	end

  def save(conn)
    @id = conn.exec("insert into todos(title) values('#{@title}') returning id")[0]['id']
  end

  def delete(conn)
    conn.exec("delete from todos where id = #{@id}")
  end

  def update(conn, title)
  		conn.exec("update todos set title='#{title}' where id=#{@id}")
  end

  def self.findById(conn, id)
  	res = conn.exec("select * from todos where id=#{id}")[0]
  	todo = self.new(res['title'])
  	todo.id = id
  	todo
  end

	def self.all(conn)
		arr_hashs = conn.exec( "SELECT * FROM todos" )
		res_hashs = []
		arr_hashs.each do |el| 
			todo = ToDo.new(el['title'])
			todo.id = el['id']
			res_hashs << todo
		end
		res_hashs
	end
end
