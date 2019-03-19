require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Startup 1", "Founder 1", "Domain 1")
s2 = Startup.new("Startup 2", "Founder 2", "Domain 2")
s3 = Startup.new("Startup 3", "Founder 3", "Domain 3")

vc1 = VentureCapitalist.new("VC1", 20000000)
vc2 = VentureCapitalist.new("VC2", 5000000000)
vc3 = VentureCapitalist.new("VC3", 6000000000)

fr1 = FundingRound.new(s1, vc1, "Angel", 500000)
fr2 = FundingRound.new(s1, vc2, "Angel", 1000000)
# fr3 = FundingRound.new(s1, vc3, "Angel", 3000000)
fr4 = FundingRound.new(s2, vc1, "Seed", 1600000)
fr5 = FundingRound.new(s2, vc2, "Seed", 1800000)
fr6 = FundingRound.new(s3, vc3, "Angel", 3000000)
fr7 = FundingRound.new(s1, vc2, "Wack", 3000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

# s4 = Startup.new("Startup 4", "Founder 4", "Domain 1")
# fr7 = FundingRound.new(s1, vc2, "Wack", 3000000)