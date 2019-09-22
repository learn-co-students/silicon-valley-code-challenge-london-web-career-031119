require_relative '../config/environment.rb'
require 'pry'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


c1 = VentureCapitalist.new("bob", 1949595959)
c2 = VentureCapitalist.new("tap", 194959444445959)
c3 = VentureCapitalist.new("guy", 15445454)
c4 = VentureCapitalist.new("mat", 144459)



s1 = Startup.new("Things", "Ric", "fsafsa")
s2 = Startup.new("Thongs", "Oli", "www")
s3 = Startup.new("Thangs", "Ran")
s4 = Startup.new("Thungs", "Pet", "www44")


f1 =   FundingRound.new(s1, c1, "Angel", 4383)
f2 =   FundingRound.new(s3, c2, "Angel", 4983)
f3 =   FundingRound.new(s2, c3, "Series A", 49383)
f4 =   FundingRound.new(s1, c4, "Seed", 411983)
f5 =   FundingRound.new(s4, c1, "Series A", 434983)






binding.pry
0 #leave this here to ensure binding.pry isn't the last line
