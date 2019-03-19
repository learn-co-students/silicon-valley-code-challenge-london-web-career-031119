class Startup

  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name_String, founder_String, domain_String)
    @name = name_String
    @founder = founder_String
    @domain = domain_String
    
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def pivot(domain_String, name_String)
    @domain = domain_String
    @name = name_String
    self
  end

  def self.find_by_founder(founder_String)
    Startup.all.find{ |startup| startup.founder == founder_String}
  end
  
  def self.domains
    Startup.all.map{ |startup| startup.domain }.uniq
  end

  def sign_contract(vc_Object, type_String, investment_Float)
    FundingRound.new(self, vc_Object, type_String, investment_Float)
  end

  def funding_rounds
    FundingRound.all.select{ |f_round| f_round.startup == self }
  end

  def num_funding_rounds
    funding_rounds.count
  end

  def total_funds
    sum = 0
    funding_rounds.each{ |f_round| sum += f_round.investment}
    sum
  end

  def investors
    funding_rounds.map{ |f_round| f_round.venture_capitalist }.uniq
  end

  def big_investors
    investors.select{ |vc| VentureCapitalist.tres_commas_club.include?(vc) }
  end

end
