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

  def self.arr_map(arr_hashs)
  	res_hashs = []
		arr_hashs.each do |el| 
			todo = ToDo.new(el['title'])
			todo.id = el['id']
			res_hashs << todo
		end
		res_hashs
  end

	def self.all(conn)
		arr_hashs = conn.exec( "SELECT * FROM todos" )
		arr_map(arr_hashs)
	end

	def self.where(conn, params)
		sql = "SELECT id, title FROM todos where "
		params.each do |param|
			if (param[1].class == Integer) 
				sql += " #{param[0]} = #{param[1]} and"
			else
				sql += " #{param[0]} = '#{param[1]}' and"
			end
		end
		#sql_length_needed = sql.size - 4
		#sql = sql.slice(0, sql_length_needed) + ';'
		sql = sql.chomp(" and") + ';'
		arr_hashs = conn.exec(sql)
		arr_map(arr_hashs)
	end
end
