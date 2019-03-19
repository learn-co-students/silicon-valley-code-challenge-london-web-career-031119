class Startup

attr_accessor :name, :founder
attr_reader :domain
attr_writer

@@all = []

def self.all
@@all
end

def initialize(name, founder, domain)
  @name = name
  @founder = founder
  @domain = domain

  @@all << self
end

def pivot(domain, name)
  @domain = domain
  @name = name
end

def self.find_by_founder(name)
  @@all.find {|startup| startup.name == name }
end

def self.domains
  @@all.map {|startup| startup.domain}.uniq
end

def sign_contract(venture_capitalist, investment, type)
  FundingRound.new(self, venture_capitalist, investment, type)
end

def self.num_funding_rounds
@@all.length
end

def total_funds
  array = FundingRound.all.collect do |funding_rounds|
    if funding_rounds.startup == self
    funding_rounds.investment
  end
end
    array.compact.inject(:+)
end



def investors
  array = FundingRound.all.collect do |funding_rounds|
    if funding_rounds.startup == self
      funding_rounds.venture_capitalist
end
end
array.compact
end

def big_investors
  array = self.investors
  results = array.select{|venture_capitalist| (venture_capitalist.total_worth) && venture_capitalist.total_worth > 1000000000}
    results
end



end
