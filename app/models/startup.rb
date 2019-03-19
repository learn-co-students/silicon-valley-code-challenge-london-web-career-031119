class Startup
  attr_reader :domain
  attr_accessor :name, :founder
  @@all = []
  def initialize (name, founder, domain)
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
  end

  def self.find_by_founder (founder)
    Startup.all.find {|i| i.founder == founder}
  end


  def self.domains
    Startup.all.map {|i| i.domain}.uniq
  end

  def sign_contract(vc, type, amount)
    FundingRound.new(self,vc, type, amount)
  end

  def fundings
    FundingRound.all.select {|i| i.startup == self}
  end

  def num_funding_rounds
    fundings.length
  end

  def total_funds
    fundings.map {|i| i.investment}.inject(:+)
  end

  def investors
    fundings.map {|i| i.venture_capitalist}.map
  end

  def big_investors
   VentureCapitalist.tres_commas_club & investors
end
