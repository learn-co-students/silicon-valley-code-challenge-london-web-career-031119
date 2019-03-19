class VentureCapitalist
  attr_accessor :name, :total_worth
  @@all = []
  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    VentureCapitalist.all.select {|i| i.total_worth >= 1000000000}
  end

  def offer_contract (startup,type, investment)
    FundingRound(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|i| i.venture_capitalist == self}
  end

  def biggest_investment
    FundingRound.all.select {|i| i.venture_capitalist == self}.max_by{|i| i.investment}
  end

  def portfolio
    funding_rounds.map(&:startup)
  end

  def biggest_investment
    funding_rounds.max_by {|i| i.investment}
  end

  def invested (domain)
    
  end

end
