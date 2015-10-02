require "./user.rb"
require "mysql"
class Connection < User
	def open
		@con = Mysql.new("localhost", "root", "password", "contacts_manager")
		if @con
			puts "connection established"
		end
	end
	def close
		@con.close
	end

	def insert
		@con.query("INSERT INTO addressbook(first_name, last_name, phone_number, email, skype_id) VALUES ('#{@first_name}', '#{@last_name}', '#{@num}', '#{@email}', '#{@skype_id}')")
	end
	def view
		puts "Enter the first name of contact to be viewed"
  	value = gets.chomp
		rs = @con.query("SELECT * FROM addressbook WHERE first_name = '#{value}'")
		 puts rs.fetch_row.join("\s")
	end

	def show
		rs = @con.query("SELECT * FROM addressbook")
		rs.num_rows.times do
			puts rs.fetch_row.join("\s")
		end
	end	
	
	def delete
		puts "Enter the first name contact to be deleted"
  	value = gets.chomp
  	rs = @con.query("DELETE FROM addressbook WHERE first_name = '#{value}'")
	end

	def edit
		puts "Enter the contact you want to edit"
		value = gets.chomp
		rs = @con.query("SELECT * FROM addressbook WHERE first_name = '#{value}'")
		 puts rs.fetch_row.join("\s")
		 puts "press the ID"
		 id = gets.chomp.to_i
		puts "\t which field you want to edit? Press the number"
		puts "\t\t 1. first_name \n\t\t 2.last_name \n\t\t 3. phone_number \n\t\t 4.email \n \t\t 5.skype_id"
		input = gets.chomp.to_i
		case input
		when 1
			get_data(id, 'first_name')
		when 2
			get_data(id, 'last_name')
		when 3
			get_data(id, 'phone_number')
		when 4
			get_data(id, 'email')
		when 5
			get_data(id, 'skype_id')
		end
	end

	def get_data(id, value)
		puts "Enter new #{value}"
		entered_value = gets.chomp
		rs = @con.query("UPDATE addressbook SET #{value} = '#{entered_value}' WHERE id = '#{id}'")
	end
			
		
					

end
data = Connection.new
data.open
data.display





