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
    VentureCapitalist.all.select {|i| i.total_worth > 1000000000}
    #returns an array of all venture capitalists in the Trés Commas club
    #(they have more than 1,000,000,000 total_worth)
  end

  def offer_contract(startup, type, investment)
    # binding.pry
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|i|i.venture_capitalist == self }
  end

  def portfolio
    funding_rounds.map {|i|i.startup}.uniq
  end

  def biggest_investment
    funding_rounds.max_by {|i| i.investment}
  end

  def invested(domain)
    counter = 0
    funding_rounds.each do |x|
      if x.startup.domain == domain
        counter =+ x.investment
      end
    end
    counter
  end

end
