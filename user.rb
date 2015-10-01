


class User 
	attr_accessor:first_name, :last_name, :num, :email, :skype_id, :detail
	def display
		exit = true
		while exit
			puts "\t\t\t Contacts Manager \t \t \t"
			puts "\t\t 1. Add Contact"
			puts "\t\t 2. View Contact"
			puts "\t\t 3. Edit Contact"
			puts "\t\t 4. Show All Contacts"
			puts "\t\t 5. Delete Contact"
			puts "Enter your choice"
			choice = gets.chomp.to_i
			case choice
			when 1
				add
				puts "Successfully created"
			when 2
				view
			when 3 
				edit
			when 4
				show
			when 5
				delete

			end
			puts "press M for main menu or any key to exit"
			input = gets.chomp
			if input == "m"
				exit = true
			else
				exit = false
			end
		end
		
	end
	def add
		print"enter your First name: "
    @first_name = gets.chomp
    # @addressbook[:name]= @name
    print"enter your last name: "
    @last_name = gets.chomp
    print"enter number: "
    @num = gets.chomp
    # @addressbook[:number] = @num
    print"enter email id::"
    @email = gets.chomp
    # @addressbook[:email] = @email
    print"enter skype Id::"
    @skype_id= gets.chomp
    # @addressbook[:skype] = @skype_id
    insert
  end

end

# user = User.new
# data = Connection.new
# data.open
# name = User.new
# name.display
# data.display



