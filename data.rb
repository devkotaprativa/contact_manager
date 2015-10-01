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
		puts "Enter the contact to be viewed"
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
puts "Enter the contact to be deleted"
  	value = gets.chomp
  	rs = @con.query("DELETE FROM addressbook WHERE first_name = '#{value}'")
	end
end
data = Connection.new
data.open
data.display
# data.insert




