class FundingRound

  attr_reader :startup, :venture_capitalist
  attr_writer
  attr_accessor :type, :investment

  @@all = []

def self.all
  @@all
end

def initialize(startup, venture_capitalist, investment, type)
  @startup = startup
  @venture_capitalist = venture_capitalist
  @investment = investment > 0 ? investment : 0
  @type = type
  @@all << self
end

def investment
  @investment < 0 && (@investment = 0)
  @investment.to_f
end



end
