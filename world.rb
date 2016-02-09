puts "\e[H\e[2J"
require "titleize"

class World

  #politicians and voters empty arrays
  def initialize
    @voters = []
    @politicians = []
  end

  #line break method
  def space
    puts " "
  end

  #welcome method
  def welcome
    puts "Welcome to the Voter Sim!"
    (sleep 2)
    main_menu
  end

  #main menu method
  def main_menu
    space
    puts "What would you like to do?"
    space
    puts "(C)reate, (L)ist, (U)pdate, (D)elete, or (Q)uit:"
    input = gets.chomp.downcase
    case input
      when "c"
        create
      when "l"
        list
      when "u"
        update
      when "d"
        delete
      when "q"
        quit
      else
        space
        puts "Sorry, your response was not one of the available choices. Please try again."
        (sleep 1)
      main_menu
    end
  end

  #create method
  def create
    space
    puts "Would you like to create a (P)olitician or (V)oter?"
    input = gets.chomp.downcase
    case input
      when input = "p"
        create_politician
      when input = "v"
        create_voter
      else
        space
        puts "Sorry, your response was not one of the available choices. Please try again."
        (sleep 1)
        create
    end
  end

    #create politican method
    def create_politician
      space
      puts "Please enter the politician's first and last name:"
      name = gets.chomp.titleize
      space
      puts "Please enter the politician's party --"
      puts "(D)emocrat or (R)epublican:"
      party = gets.chomp.downcase
      case party
        when party = "d"
          party = "Democrat"
        when party = "r"
          party = "Republican"
        else
          space
          puts "Sorry, your response was not one of the available choices. Please try again."
          create_politician
      end
      @politicians << Politician.new(name, party)
      space
      puts "Politician #{name} has been entered as a #{party}."
      (sleep 2)
      main_menu
    end

    #create voter method
    def create_voter
      space
      puts "Please enter the voter's first and last name:"
      name = gets.chomp.titleize
      space
      puts "Please enter the voter's political affiliation --"
      puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral:"
      affiliation = gets.chomp.downcase
      case affiliation
        when affiliation = "l"
          affiliation = "Liberal"
        when affiliation = "c"
          affiliation = "Conservative"
        when affiliation = "t"
          affiliation = "Tea Party"
        when affiliation = "s"
          affiliation = "Socialist"
        when affiliation = "n"
          affiliation = "Neutral"
        else
          space
          puts "Sorry, your response was not one of the available choices. Please try again."
          create_voter
      end
      @voters << Voter.new(name, affiliation)
      space
      puts "Voter #{name} has been entered as a #{affiliation}."
      (sleep 2)
      main_menu
    end

  #list method
  def list
  	space
  	puts "Would you like to see a list of (P)oliticians or (V)oters?"
  	input = gets.chomp.downcase
  	case input
    	when "p"
    		space
    		puts "Politicians:"
        space
        politicians_list
    		main_menu
      when "v"
        space
        puts "Voters:"
        space
        voters_list
        main_menu
    	else
        space
        puts "Sorry, your response was not one of the available choices. Please try again."
        list
    	end
  end

    #politicians list method
    def politicians_list
    	@politicians.each do |x|
    		puts " - #{x.name} (#{x.party})"
    	end
    end

    #voters list method
    def voters_list
    	@voters.each do |x|
    		puts " - #{x.name} (#{x.affiliation})"
    	end
    end

  #update method
  def update
  	space
  	puts "Would you like to update a (P)olitician or a (V)oter?"
  	input = gets.chomp.downcase
  	case input
  	when "p"
  		update_politician
    when "v"
      update_voter
  	else
  		space
      puts "Sorry, your response was not one of the available choices. Please try again."
  		update
  	end
  end

    def update_politician
    	space
    	politicians_list
      space
    	puts "Which politician would you like to update?"
      politician_update = gets.chomp.titleize
    	@politicians.each do |change|
    		  if change.name == politician_update
          space
    			puts "Would you like to update the politician's (N)ame or (P)arty?"
    			  name_elsif_party = gets.chomp.downcase
      			if name_elsif_party == "n"
              space
      				puts "Please enter the updated name:"
      				updated_name = gets.chomp.titleize
      				change.name = updated_name
      				space
      				puts "The politician's name has been changed to #{updated_name}."
              (sleep 2)
      			elsif name_elsif_party == "p"
              space
      				puts "Would you like to update the politician's party to (R)epublican or (D)emocrat?"
      				updated_party = gets.chomp.downcase
      				if updated_party == "d"
      					updated_party = "Democrat"
      				elsif  updated_party == "r"
      					updated_party ="Republican"
      				else
                space
                puts "Sorry, your response was not one of the available choices. Please try again."
      					update_politician
    				end
    				change.party = updated_party
    				space
    				puts "The politician's name has been changed to #{updated_party}."
            (sleep 2)
    			else
    				space
            puts "Sorry, your response was not one of the available choices. Please try again."
    				update_politician
    			end
    			main_menu
    		else
    			puts "That politician is not on listed. Please re-enter the poitician's name."
    			update_politician
    		end
    	end
    end

    # def update_voter
    # 	space
    # 	voters_list
    #   space
    # 	puts "Which voter would you like to update?"
    #   voter_update = gets.chomp.titleize
    # 	@voters.each do |change|
    # 		  if change.name == voter_update
    #       space
    	# 		puts "Would you like to update the politician's (N)ame or (P)arty?"
    	# 		  name_elsif_party = gets.chomp.downcase
      # 			if name_elsif_party == "n"
      #         space
      # 				puts "Please enter the updated name:"
      # 				updated_name = gets.chomp.titleize
      # 				change.name = updated_name
      # 				space
      # 				puts "The voter's name has been changed to #{updated_name}."
      #         (sleep 2)
      # 			elsif name_elsif_party == "p"
      #         space
      # 				puts "Would you like to update the politician's party to (R)epublican or (D)emocrat?"
      # 				updated_party = gets.chomp.downcase
      # 				if updated_party == "d"
      # 					updated_party = "Democrat"
      # 				elsif  updated_party == "r"
      # 					updated_party ="Republican"
      # 				else
      #           space
      #           puts "Sorry, your response was not one of the available choices. Please try again."
      # 					update_politician
    	# 			end
    	# 			change.party = updated_party
    	# 			space
    	# 			puts "The politician's name has been changed to #{updated_party}."
      #       (sleep 2)
    	# 		else
    	# 			space
      #       puts "Sorry, your response was not one of the available choices. Please try again."
    	# 			update_politician
    	# 		end
    	# 		main_menu
    	# 	else
    	# 		puts "That politician is not on listed. Please re-enter the poitician's name."
    	# 		update_politician
    	# 	end
    end

  #quit program method
  def quit
  end

end #class World

class Politician < World
  attr_accessor :name, :party
  def initialize(name, party)
    @name = name
    @party = party
  end
end

class Voter < World
  attr_accessor :name, :affiliation
  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation
  end
end


world = World.new
world.welcome
