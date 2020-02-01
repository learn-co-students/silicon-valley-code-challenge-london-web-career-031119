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

  def pivot (name, domain)
    @name = name
    @domain = domain
    return self
  end

  def self.find_by_founder(founder)
    @@all.find {|startup| startup.founder == founder}
  end

  def self.domains
    @@all.collect {|startup| startup.domain}
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funders
    FundingRound.all.select {|funding_round| funding_round.startup == self}
  end

  def funding_rounds
    self.funders.count
  end

  def total_funds
    total_funds = 0
    self.funders.each {|funding_round| total_funds += funding_round.investment}
    total_funds
  end

  def investors
    self.funders.collect {|funding_round| funding_round.venture_capitalist.name}.uniq
  end

  def big_investors
    VentureCapitalist.tres_commas_club & investors
    # investors.select {|person| VentureCapitalist.tres_commas_club.include?(person) }
  end

end
