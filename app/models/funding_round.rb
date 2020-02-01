class FundingRound
# SPT Many startups have funding, funding is provided by many VCs

@@all = []

attr_reader :startup, :venture_capitalist, :type, :investment

def initialize(startup,venture_capitalist,type,investment)
  @startup = startup #obj
  @venture_capitalist = venture_capitalist #obj
  @type = type
  @investment = investment.to_i
  @@all << self
end

def self.all
  @@all
end

end
