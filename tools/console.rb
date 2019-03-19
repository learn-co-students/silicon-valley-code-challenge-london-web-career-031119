require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new('super-startup', 'Jo', 'CBD')
startup2 = Startup.new('blackstar', 'Juliet', 'Law')
startup3 = Startup.new('powernap', 'Jane', 'Health')
startup4 = Startup.new('easygreen', 'Gul', 'Green-tech')

vc1 = VentureCapitalist.new('ohMyMonney', 2000000000)
vc2 = VentureCapitalist.new('sweetWomen', 1000000000)
vc3 = VentureCapitalist.new('bigAssVc', 33000000000)
vc4 = VentureCapitalist.new('littlegem', 22500000000)
vc5 = VentureCapitalist.new('verycool', 2200500000000)


fg1 = FundingRound.new(startup1, vc1, 'Pre-seed', 4000000)
fg2 = FundingRound.new(startup2, vc3, 'Angel', 23000)
fg3 = FundingRound.new(startup3, vc4, 'Series A', 43000)
fg4 = FundingRound.new(startup4, vc2, 'Series B', 400000)
fg5 = FundingRound.new(startup1, vc2, 'Series A', 300000)
fg6 = FundingRound.new(startup3, vc1, 'Series B', 400000)
fg7 = FundingRound.new(startup2, vc2, 'Series A', 400000)
fg8 = FundingRound.new(startup1, vc4, 'Series B', 111145000)
fg9 = FundingRound.new(startup1, vc3, 'Series C', 45000)
fg10 = FundingRound.new(startup4, vc1, 'Pre-seed', 2345000000)
fg11 = FundingRound.new(startup3, vc3, 'Pre-seed', 2345000000)










binding.pry
0 #leave this here to ensure binding.pry isn't the last line
