class Startup
  attr_accessor :name, :domain
  attr_reader :founder

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    self.class.all << self
  end

  def self.all
    @@all
  end

  def pivot(name,domain)
    self.name = name
    self.domain = domain
  end

  def self.find_by_founder(founder)
    FundingRound.all.find {|fr| fr.startup.founder == founder}
  end

  def self.domains
    self.all.map {|s| s.domain}
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|fr| fr.startup == self}
  end

  def num_funding_rounds
    funding_rounds.size
  end

  def total_funds
    funding_rounds.inject(0) {|sum, a| sum + a.investment}
  end

  def investors
    funding_rounds.map {|a| a.venture_capitalist}.uniq
  end

  def big_investors
    investors & VentureCapitalist.tres_commas_club
  end

end
