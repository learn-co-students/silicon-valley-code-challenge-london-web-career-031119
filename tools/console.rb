require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Startup
s1 = Startup.new("MyStartup", "Gio", "domain.com")
s2 = Startup.new("MyStartup2", "Diogo", "domain2.com")
s3 = Startup.new("MyStartup3", "Guy", "domain3.com")
s4 = Startup.new("MyStartup4", "Nico", "domain4.com")
s5 = Startup.new("MyStartup5", "George", "domain5.com")

#Venture Capitalist
v1 = VentureCapitalist.new("Black Rock", 1000000000)
v2 = VentureCapitalist.new("Future Tech", 9234533)
v3 = VentureCapitalist.new("SVT", 1000)
v4 = VentureCapitalist.new("Green Valley", 1000000000000)
v5 = VentureCapitalist.new("Black Coffee", 1000000000)

#Funding Rounds
round1 = FundingRound.new(s1, v1, "Angel", 50)
round6 = FundingRound.new(s1, v1, "Angel2", 23460)
round7 = FundingRound.new(s2, v1, "Deal", 300)
round2 = FundingRound.new(s2, v2, "Pre-Seed", 350)
round3 = FundingRound.new(s3, v3, "Seed", 1000)
round4 = FundingRound.new(s4, v4, "Series A", 5043)
round5 = FundingRound.new(s1, v5, "Series B", 45567)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
