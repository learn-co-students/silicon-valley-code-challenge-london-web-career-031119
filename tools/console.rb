require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new('super-startup', 'Jo', 'CBD')
startup2 = Startup.new('blackstar', 'Juliet', 'Law')
startup3 = Startup.new('powernap', 'Jane', 'Health')
startup4 = Startup.new('easygreen', 'Gul', 'Green-tech')

vc1 = VentureCapitalist.new('ohMyMonney', 2_000_000_000)
vc2 = VentureCapitalist.new('sweetWomen', 1_000_000_000)
vc3 = VentureCapitalist.new('bigAssVc', 33_000_000_000)
vc4 = VentureCapitalist.new('littlegem', 22_500_000_000)
vc5 = VentureCapitalist.new('verycool', 2_200_500_000_000)


fg1 = FundingRound.new(startup1, vc1, 'Pre-seed', 4_000_000)
fg2 = FundingRound.new(startup2, vc3, 'Angel', 23_000)
fg3 = FundingRound.new(startup3, vc4, 'Series A', 43_000)
fg4 = FundingRound.new(startup4, vc2, 'Series B', 400_000)
fg5 = FundingRound.new(startup1, vc2, 'Series A', 300_000)
fg6 = FundingRound.new(startup3, vc1, 'Series B', 400_000)
fg7 = FundingRound.new(startup2, vc2, 'Series A', 400_000)
fg8 = FundingRound.new(startup1, vc4, 'Series B', 111_145_000)
fg9 = FundingRound.new(startup1, vc3, 'Series C', 45_000)
fg10 = FundingRound.new(startup4, vc1, 'Pre-seed', 2_345_000_000)
fg11 = FundingRound.new(startup3, vc3, 'Pre-seed', 2_345_000_000)










binding.pry
0 #leave this here to ensure binding.pry isn't the last line
