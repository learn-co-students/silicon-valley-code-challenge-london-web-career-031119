require_relative '../config/environment.rb'
require_relative '../app/models/funding_round.rb'
require_relative '../app/models/startup.rb'
require_relative '../app/models/venture_capitalist.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Startup 1", "Founder 1", "Domain 1")
s2 = Startup.new("Startup 2", "Founder 2", "Domain 2")
s3 = Startup.new("Startup 3", "Founder 3", "Domain 3")

vc1 = VentureCapitalist.new("VC1")
vc2 = VentureCapitalist.new("VC2")
vc3 = VentureCapitalist.new("VC3")

fr1 = FundingRound.new(s1, vc1, "Angel", 500)
fr2 = FundingRound.new(s1, vc2, "Angel", 1000)
fr3 = FundingRound.new(s1, vc3, "Angel", 3000)
fr4 = FundingRound.new(s2, vc1, "Seed", 1600)
fr5 = FundingRound.new(s2, vc2, "Seed", 1800)
fr6 = FundingRound.new(s3, vc3, "Angel", 3000)

#s1 received 4500 (3 rounds, all vcs), s2 received 3400 (2 rounds, vc1 vc2), s3 received 3000 (1 round vc3)
#vc1 invested 2100 (s1 and s2), vc2 invested 2800 (s1, s2), vc3 invested 6000 (s1,s3)
#total funding rounds 6 total to $10900

binding.pry
puts "Waddle waddle" #leave this here to ensure binding.pry isn't the last line
#
# Testing:
# s2.pivot("Startup 2 New", "Domain 2 New")
# #=> "Startup 2" no longer exist
# s3.sign_contract(vc3, "Series A", 4000)
# #=> s3 received 7000 (2 rounds both from vc3)
