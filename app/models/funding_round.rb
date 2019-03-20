require_relative './venture_capitalist.rb'
require_relative './startup.rb'

class FundingRound
  attr_reader :startup, :vent_capitalist, :ammount_invested, :type_investment

  @@all = []

  def initialize(startup, vent_capitalist, type_investment = nil, ammount_invested)
    @startup = startup
    @vent_capitalist = vent_capitalist
    @ammount_invested = ammount_invested
    @type_investment = type_investment
    @@all << self
  end

  def startup
    @startup
  end

  def venture_capitalist
    @vent_capitalist
  end

  def type
    @type_investment
  end

  def investment
   temp_investment = FundingRound.all.map {|i| i.ammount_invested}
   temp_investment.inject(0){|sum,x| sum + x }

  end

  def self.all
    @@all
  end

end
