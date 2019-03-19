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
    @@all.select {|vc| vc.total_worth >= 1_000_000_000}
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
  end

  def portfolio
    self.funding_rounds.map {|funding_round|funding_round.startup.name}.uniq
  end

  def biggest_investment
    self.funding_rounds.max_by {|funding_round|funding_round.investment}
  end

  def invested(domain)
    array_of_domains = self.funding_rounds.select {|funding_round|funding_round.startup.domain == domain}
    array_of_domains.map {|funding_round| funding_round.investment}.reduce(:+)
  end

end
