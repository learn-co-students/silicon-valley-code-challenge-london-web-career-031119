class Startup
  attr_accessor :name
  attr_reader :founder, :domain
  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(name, domain)
    @name = name
    @domain = domain
  end

  def self.find_by_founder(founder_name)
    Startup.all.find {|i| i.founder == founder_name}
  end

  def self.domains
    Startup.all.map {|i| i.domain}.uniq
    Startup.all.map(&:domain).uniq
    # should return an array of all of the different startup domains
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def fundings
    FundingRound.all.select {|i| i.startup == self}
  end

  def num_funding_rounds
    fundings.map { |i| i.investment}.reduce(:+)
  end

  def investors
    fundings.map {|i| i.venture_capitalist.name}.uniq
  end

  def big_investors
    var1 = fundings.map {|i| i.venture_capitalist}
    var2 = VentureCapitalist.all.select {|i| i.total_worth > 1000000000}
    (var1 & var2).uniq
  end
end
