require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new("Startup1", "Startup1founder", "www.startup1.com")
startup2 = Startup.new("Startup2", "Startup2founder", "www.startup2.com")
startup3 = Startup.new("Startup3", "Startup3founder", "www.startup3.com")
startup4 = Startup.new("Startup4", "Startup4founder", "www.startup4.com")
startup5 = Startup.new("Startup5", "Startup5founder", "www.startup5.com")

venture_capitalist1 = VentureCapitalist.new("Venture_capitalist1")
venture_capitalist2 = VentureCapitalist.new("Venture_capitalist2")
venture_capitalist3 = VentureCapitalist.new("Venture_capitalist3")
venture_capitalist4 = VentureCapitalist.new("Venture_capitalist4")
venture_capitalist5 = VentureCapitalist.new("Venture_capitalist5")

# type = Angel, Pre-Seed, Seed, Series A, Series B, Series

contract1 = startup1.sign_contract(venture_capitalist1, 300000, "Angel")
contract2 = startup1.sign_contract(venture_capitalist2, 400000, "Angel")
contract3 = startup1.sign_contract(venture_capitalist2, 500000, "Angel")
contract4 = startup3.sign_contract(venture_capitalist1, 600000, "Angel")
contract5 = startup4.sign_contract(venture_capitalist1, 1500000000, "Angel")
contract6 = venture_capitalist5.offer_contract(startup3, "Angel", 15000000000.00)


# p Startup.all
# p VentureCapitalist.all
# p FundingRound.all
# p contract1.investment
# p venture_capitalist2.total_worth
# p VentureCapitalist.tres_commas_club
# p Startup.num_funding_rounds
# p startup1.total_funds
# p startup1.investors
# p startup1.big_investors
# p contract1.venture_capitalist
# p contract6
# p venture_capitalist1.portfolio
# p venture_capitalist1.biggest_investment
# p venture_capitalist1.invested("www.startup1.com")
# p Startup.find_by_founder("Startup1")

# p startup1.pivot("testdomain", "testname")
#{}p startup1
# startup1.domain = "changed"

# binding.pry
0 #leave this here to ensure binding.pry isn't the last line
