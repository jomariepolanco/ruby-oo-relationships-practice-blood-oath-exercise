class BloodOath 

    attr_reader :date
    attr_accessor :cult, :follower

    @@all = [] 

    def initialize(date)
        @date = date 
        @cult = cult
        @follower = follower
        @@all << self  
    end

    def self.all
        @@all
    end 

    def self.first_oath
        self.all[0].follower 
    end
end

# bloodoath belongs to cult - 
# blood oath belongs to follower -