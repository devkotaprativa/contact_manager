class User
	def display
		puts "\t\t\t Contacts Manager \t \t \t"
		puts "\t\t 1. Add Contact"
		puts "\t\t 2. Show All Contacts"
		puts "\t\t 3. Edit Contact"
		puts "\t\t 4. Delete Contact"
		puts "Enter your choice"
		choice = gets.chomp.to_i
		case choice
		when 1
			add
			puts "Successfully created"
		when 2
			show
		when 3 
			edit
		when 4
			delete
		end
	end
end