class Startup
  attr_accessor :name, :founder, :domain

  @@all = []

  def initialize(founder, name, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(name, domain)
    # Given a string of a domain and a string of a name, change the domain and name of the startup
    @name = name
    @domain = domain
  end

  def self.find_by_founder(name)
    # Given a string of a founder's name, returns the first startup whose founder's name matches
    Startup.all.find { |company| company.founder == self.founder }
  end

  def self.domains
    # Returns a string that is the startup's domain
    Startup.all.map { |company| company.domain }.uniq
  end

  def sign_contract(vent_capitalist, type, amount)
    # Creates a new funding round
    FundingRound.new(self, vent_capitalist, type, amount.to_f)
  end

  def num_funding_rounds
    # Returns the total number of funding rounds that the startup has gotten
    FundingRound.all.select { |round| round.startup == self }
  end

  def total_funds
    # Returns the total sum of investments that the startup has gotten
    res = 0
    num_funding_rounds.each { |round| res += round.investment }
  end

  def investors
    # Returns a unique array of all the venture capitalists that have invested in this company
    num_funding_rounds.map { |round| round.venture_capitalist}.uniq
  end

  def big_investors
    # Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
    investors.select{ |person| VentureCapitalist.tres_commas_club.include?(person)}
  end
end
