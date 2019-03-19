class VentureCapitalist
  
  attr_accessor
  attr_reader :name, :total_worth

  @@all = []

  def initialize(name_String, worth_Num)
    @name = name_String
    @total_worth = worth_Num
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.tres_commas_club
    VentureCapitalist.all.select{ |vc| vc.total_worth > 1000000000}
  end

  def offer_contract(startup_Object, type_String, investment_Float)
    FundingRound.new(startup_Object, self, type_String, investment_Float)
  end

  def funding_rounds
    FundingRound.all.select{ |f_round| f_round.venture_capitalist == self }
  end

  def portfolio
    funding_rounds.map{ |f_round| f_round.startup }.uniq
  end

  def biggest_investment
    funding_rounds.sort{ |a, b| b.investment <=> a.investment }.first
  end

  def invested(domain_String)
    sum = 0
    funding_rounds.select{ |f_round| f_round.startup.domain == domain_String }.map{ |f_round| sum += f_round.investment }
    sum
  end

end
