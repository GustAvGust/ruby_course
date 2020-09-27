#require_relative "./file_data.rb"
class Main
	def self.get_data_from_file(url)
		if File.exist?(url)
			file = File.new(url, "r:UTF-8")
			res_mass = file.readlines
			file.close
		else
			return nil #прикрутить выкидывание exception'a
		end
		return res_mass
	end

	def self.show_columns_name(data_mass)
		i = 0
	
		data_mass[0].split(",").each do |column_name|
			print("#{i}:#{column_name}  ")
			i += 1
		end
	end

	def self.sort_mass_by_num_of_col(num_sort_column, data_mass)
		associative_array = {}
		res_mass = [data_mass[0].chomp]

		data_mass.delete_at(0)

		data_mass.each {|line| associative_array[line.split(",")[num_sort_column]] = line}
		associative_array.keys.sort.each {|key| res_mass.push(associative_array[key].chomp)}
		data_mass.insert(0, res_mass[0])
		res_mass
	end

	def self.set_data_in_file(url_res, res_mass)
		file = File.new(url_res, "w:UTF-8")
		res_mass.each {|line| file.print("#{line}\n")}
		file.close
	end

	url_src = "data.txt"
	data_mass = get_data_from_file(url_src)
	show_columns_name(data_mass)

	puts("enter number of column sort by (0-#{data_mass[0].split(",").size - 1})")
	num_sort_column = gets.to_i

	#puts(data_mass)
	res_mass = sort_mass_by_num_of_col(num_sort_column, data_mass)
	
	url_res = "data_sorted_by_#{res_mass[0].split(",")[num_sort_column]}.txt"
	set_data_in_file(url_res, res_mass)
end