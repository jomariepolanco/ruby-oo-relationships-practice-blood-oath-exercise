class Follower 

    attr_accessor :name, :life_motto, :age, :cult, :bloodoath

    @@all = []

    def initialize(name, age, life_motto)
        @name = name 
        @age = age
        @cult = cult 
        @bloodoath = @bloodoath
        @life_motto = life_motto
        @@all << self 
    end

    def bloodoaths
        BloodOath.all.select {|bo| bo.follower == self}
    end

    def cults
        bloodoaths.map {|bo| bo.cult}
    end

    def join_cult(cult)
        self.age >= cult.minimum_age ? cult.followers << self : puts "You are too young. Try again next year!"
    end

    def self.all 
        @@all 
    end

    def self.of_a_certain_age(age)
        self.all.select {|person| person.age >= age}
    end

    def my_cults_slogans
        cults.each {|cult| cult.slogan}
    end

    def self.most_active
        self.all.max_by {|follower| follower.cults.count}
    end

    def self.top_ten
        array = self.all.map do |follower|
            {follower => follower.cults.count}
        end
        sorted_array = array.sort_by {|follower| follower.values[0]}
        sorted_array.reverse 
    end

    def fellow_cult_members
        self.class.all select {|follower| follower.cult == self.cult}
    end


end
#followers have many cults through bloodoaths- 
#followers have many bloodoaths - 