class VentureCapitalist

  attr_reader
  attr_writer
  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def total_worth
  array = FundingRound.all.collect do |funding_rounds|
    if funding_rounds.venture_capitalist == self
      funding_rounds.investment
end
end
array.compact.inject(:+)
end

  def self.tres_commas_club
  array = @@all.select do |venture_capitalist|

      (venture_capitalist.total_worth) && venture_capitalist.total_worth > 1000000000
    end
    array
  end


  

def offer_contract(startup, type, investment)
  FundingRound.new(startup, self, investment, type)
end

def portfolio
  array = FundingRound.all.collect do |funding_rounds|
    if funding_rounds.venture_capitalist == self
      funding_rounds.startup
end
end
array.compact.uniq
end

def biggest_investment
  array = FundingRound.all.select do |funding_rounds|
    funding_rounds.venture_capitalist == self
  end
  array.sort_by {|funding_rounds| funding_rounds.investment}
  array[-1]
end

def invested(domain)
  array = FundingRound.all.collect do |funding_rounds|
    if funding_rounds.startup.domain == domain
      funding_rounds.investment
end
end
  array.compact.inject(:+)
end






      end
