require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("S1", "Ranjit", "AI")
s2 = Startup.new("S2", "Riccardo", "ML")
s3 = Startup.new("S3", "Oli", "Robotics")
s4 = Startup.new("S4", "Peter", "FinTech")

vc1 = VentureCapitalist.new("Myrto", 2000000000)
vc2 = VentureCapitalist.new("Kevin", 3000000000)
vc3 = VentureCapitalist.new("Cully", 1000000000)
vc4 = VentureCapitalist.new("George", 500000000)

fr1 = FundingRound.new(s1, vc1, "Angel", 500000)
fr2 = FundingRound.new(s2, vc2, "Pre-Seed", 700000)
fr3 = FundingRound.new(s3, vc3, "Seed", 800000)
fr4 = FundingRound.new(s4, vc4, "Series A", 1000000)

s1.sign_contract(vc1, "Series A", 1000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
