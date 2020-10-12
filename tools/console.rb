require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new("cult1", "denver", 1983, "let it be bread")
cult2 = Cult.new("cult2", "new jersey", 1998, "wawa forever")
cult3 = Cult.new("cult3", "new jersey", 1885, "we're old")

john = Follower.new("John", 32, "i love carbs")
ashley = Follower.new("Ashley", 16, "no quickcheck for me")
wendy = Follower.new("Wendy", 36, "who's billie?")

bo1 = BloodOath.new("2020-03-04")
bo2 = BloodOath.new("2020-03-08")
bo3 = BloodOath.new("2020-03-15")
bo4 = BloodOath.new("2020-04-04")

bo1.cult = cult1 
bo1.follower = john 
bo2.cult = cult2
bo2.follower = ashley 
bo3.follower = wendy 
bo3.cult = cult3
bo4.cult = cult1 
bo4.follower = wendy 

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits