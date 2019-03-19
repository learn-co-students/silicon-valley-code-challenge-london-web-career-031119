# Startup has many VentureCapitalist through FundingRound
# startup has many FundingRound

class Startup

  attr_accessor :name, :domain
  attr_reader :founder

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def pivot(new_domain, new_name)
    # pblm: how to change the domain name since we have a reader (and we cannot change to accessor)
    #startup1.pivot(new_domain, new_name) =>
    # startup1 => object new_name, Jo, new_domain
    self.name = new_name
    self.domain = new_domain
    self

  end

  def find_by_founder(founder_name)
    Startup.all.find { |startup| startup.founder == founder_name }
  end

  def self.domains
    Startup.all.collect { |domain| domain.domain }
  end

  def self.all
    @@all
  end

  def sign_contract(venture_capitalistc, type, amount_investment)
    # creates a new funding round and associates it with that startup and venture capitalist.
    FundingRound.new(self, venture_capitalist, type, amount_investment)
  end

  def num_funding_rounds
    #  Returns the total number of funding rounds that the startup has gotten
    FundingRound.all.select { |i| i.startup == self }.length

  end

  def startups_fundings
    FundingRound.all.select { |i| i.startup == self }
  end

  def total_funds
    # Returns the total sum of investments that the startup has gotten
    startups_fundings.collect {|funding| funding.amount_investment}.sum
  end

  def investors
    # Returns a **unique** array of all the venture capitalists that have invested in this company
    startups_fundings.collect { |funding| funding.venture_capitalist}.uniq
  end

  def big_investors
    # Returns a **unique** array of all the venture capitalists that
    # have invested in this company and are in the Trés Commas club
    investors & VentureCapitalist.tres_commas_club
  end



end


# - `Startup#name` - DONE
#   - returns a **string** that is the startup's name

# - `Startup#founder` - DONE
#   - returns a **string** that is the founder's name
#   - Once a startup is created, the founder cannot be changed.

# - `Startup#domain` - DONE
#   - returns a **string** that is the startup's domain
#   - Once a startup is created, the domain cannot be changed.

# - `Startup#pivot` NEED TO FIX ATTR_READER THING
#   - given a string of a **domain** and a string of a **name**, change the domain and name of the startup

# - `Startup.all` - DONE
#   - should return **all** of the startup instances

# - `Startup.find_by_founder` DONE
#   - given string of a **founder's name**, returns the **first startup** whose founder's name matches

# - `Startup.domains` DONE
#   - should return an **array** of all of the different startup domains



### Associations and Aggregate Methods

# - `Startup#sign_contract` - DONE
#   - given a **venture capitalist object**, type of investment (as a string),
# and the amount invested (as a float), creates a new funding round
# and associates it with that startup and venture capitalist.

# - `Startup#num_funding_rounds` - DONE
#   - Returns the total number of funding rounds that the startup has gotten

# - `Startup#total_funds` - DONE
#   - Returns the total sum of investments that the startup has gotten

# - `Startup#investors` - DONE
#   - Returns a **unique** array of all the venture capitalists that have invested in this company


# - `Startup#big_investors` - DONE
#   - Returns a **unique** array of all the venture capitalists that have invested in this company and are in the Trés Commas club
