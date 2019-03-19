class Startup
  @@all = []

  attr_reader :founder, :domain, :name

  def initialize(founder, name, domain)
    @founder = founder
    @name = name
    @domain = domain
    @@all << self
  end

  def pivot(domain,name)
    @name = name
    @domain = domain
  end

  def sign_contract(venture_capitalist,type,investment)
    investment.to_f >= 0 ? investment : investment = 0
    FundingRound.new(self,venture_capitalist,type,investment.to_f)
  end

  def grab_self
    Startup.all.select{|startup|startup == self}
  end

  def num_funding_rounds

  end

  def total_funds
    FundingRound.all.select{
      |funding|funding.startup == self}.map{
        |funding|funding.investment}.inject(:+)
  end

  def self.find_by_founder(founder)
    Startup.all.find{|startup|startup.founder == founder}
  end

  def investors
    FundingRound.all.select{
      |funding|funding.startup == self}.map{
        |funding|funding.venture_capitalist}.uniq
  end

  def big_investors
    FundingRound.all.select{
      |funding|funding.startup == self}.select{|funding|VentureCapitalist.tres_commas_club}
  end

  def self.domains
    Startup.all.map{|startup|startup.domain}.uniq
  end

  def self.all
    @@all
  end
end
