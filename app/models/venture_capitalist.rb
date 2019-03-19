class VentureCapitalist

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    VentureCapitalist.all.select{
      |vc|vc.total_worth.to_i > 1000000000}
  end

  def total_worth
    FundingRound.all.select{
      |funding|funding.venture_capitalist == self}.map{
        |funding|funding.investment}.inject(:+)
  end

  def offer_contract(startup,type,investment)
    FundingRound.new(startup,self,type,investment.to_f)
  end

  def funding_rounds
    FundingRound.all.select{|round|round.venture_capitalist == self}
  end

  def biggest_investment
    max = 0
    self.funding_rounds.each do |round|
      max = round.investment if round.investment > max
    end
    max
  end

  def portfolio
    FundingRound.all.select{
      |round|round.venture_capitalist == self}.map{
        |round|round.startup.name}.uniq
  end

end
