require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Shazam", "DC", "www.google.com")
s2 = Startup.new("Flash", "Marvel", "www.yahoo.com")
s3 = Startup.new("batman", "DC", "www.dc.com")

v1 = VentureCapitalist.new("Jake", "1,000,000,005")
v2 = VentureCapitalist.new("Tom", "1,000,000,00000")
v3 = VentureCapitalist.new("Paul", "1,000,000")

f1 = FundingRound.new(s1, v1, "hey", 100000)
f2 = FundingRound.new(s2, v2, "test", 1000000)
f3 = FundingRound.new(s3, v3, "yo", 10000000)
f4 = FundingRound.new(s3, v1, "yo", 10000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line