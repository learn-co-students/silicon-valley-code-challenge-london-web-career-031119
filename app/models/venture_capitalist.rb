
class VentureCapitalist
  attr_accessor :name, :tot_worth, :tcc

  @@all = []

  def initialize (name, tot_worth, tcc = nil)
    @name = name
    @tot_worth = tot_worth
    @@all << self
    @tcc = tcc
    if tot_worth > 1000000000
    @tcc = true
  end
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    @@all.select {|i| i.tot_worth > 1000000000}
  end

  def total_worth
  temp_worth = VentureCapitalist.all.find {|i| i.tot_worth}
  end

  def offer_contract (startup, type, ammount)
    temp_offer = Startup.all.find {|i| i == startup}
    if temp_offer
      FundingRound.new(startup, self, type, ammount)
    else
      return "Incorrect Information Given"
    end
  end

  def funding_rounds
    FundingRound.all.select {|i| i.vent_capitalist == self}
  end

  def portfolio
    temp_startup = FundingRound.all.select {|i| i.vent_capitalist == self}
    temp_startup.map {|i| i.startup.name}.uniq
  end

  def biggest_investment
    temp_startup = FundingRound.all.select {|i| i.vent_capitalist == self}
    temp_startup.map {|i| i.ammount_invested}.max

  end

  def invested(domain_check)
  temp_startup = FundingRound.all.select {|i| i.vent_capitalist == self}
  temp_final = temp_startup.select {|i| i.startup.domain == domain_check}
  temp_count = temp_final.map{|i| i.ammount_invested}
  temp_count.inject(0){|sum,x| sum + x }
  end
    public :offer_contract
end

  # VentureCapitalist funding_rounds
  # returns an array of all funding rounds for that venture capitalist
  # # VentureCapitalist#portfolio
  # Returns a unique list of all startups this venture capitalist has funded
  # VentureCapitalist#biggest_investment
  # returns the largest funding round given by this venture capitalist
  # VentureCapitalist#invested
  # given a domain string, returns the total amount invested in that domain
