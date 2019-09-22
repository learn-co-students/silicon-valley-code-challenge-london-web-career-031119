class FundingRound
  attr_reader :startup, :venture_capitalist, :type, :investment
  # attr_reader :startup
  @@all = []

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    investment > 0 ? @investment = investment : @investment = 0
    @@all << self
  end

  def self.all
    @@all
  end

end
