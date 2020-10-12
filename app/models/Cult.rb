class Cult 

    attr_accessor :name 
    attr_reader :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name 
        @location = location 
        @founding_year = founding_year 
        @slogan = slogan 
        @@all << self 
    end

    def bloodoaths
        BloodOath.all.select {|bo| bo.cult == self}
    end

    def followers
        bloodoaths.map {|bo| bo.follower} 
    end

    def recruit_follower(follower)
        if follower.age >= minimum_age 
            follower.cult == self 
            follwers << follower
        else
            puts "You are too young. Please try again next year."
        end 
    end

    def cult_population
        followers.count 
    end

    def self.all
        @@all 
    end 

    def self.find_by_name(name)
        self.all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        self.all.select {|cult| cult.founding_year == year}
    end

    def average_age
        age_sum = followers.map {|person| person.age}.inject(:+).to_f
        avg = age_sum / followers.count
        avg  
    end

    def my_followers_mottos
        puts followers.each {|person| person.motto}
    end

    def self.least_popular
        self.all.min_by {|cult| cult.followers.count}
    end

    def self.most_common_location
        location = self.all.max_by {|cult| cult.location}
        location.location 
    end

    def minimum_age
        minimum_age = 18
    end


end # end of cult class


#cult has many followers - 
#cult has many bloodoaths - 
#cult has many followers through bloodoaths -