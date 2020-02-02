# VentureCapitalist has many startups through FundingRound
# VentureCapitalist has many FundingRound

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
    VentureCapitalist.all.select { |i| i.total_worth > 1_000_000_000 }
  end

  def offer_contract(startup, type, amount_investment)
    FundingRound.new(startup, self, type, amount_investment)
  end

  def funding_rounds
    FundingRound.select { |i| i.venture_capitalist == self}
  end

  def portfolio
    # Returns a **unique** list of all startups this venture capitalist has funded
    funding_rounds.collect {&:startup}.uniq
  end

  def biggest_investment
    # returns the largest funding round given by this venture capitalist
    funding_rounds.collect {&:amount_investment}.max
  end

  def invested(domain_name)
   # given a **domain string**, returns the total amount invested in that domain
   my_investment = funding_rounds.select { |i| i.startup.domain == domain_name }

   my_investment.collect { |i| i.venture_capitalist.total_worth}.sum
  end

end


# - `VentureCapitalist#name` DONE
#   - returns a **string** that is the venture capitalist's name

# - `VentureCapitalist#total_worth` DONE
#   - returns a **number** that is the total worth of this investor (e.g., think of it as how much money they have)

# - `VentureCapitalist.all` DONE
#   - returns an array of all venture capitalists

# - `VentureCapitalist.tres_commas_club` - DONE
#   - returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`)


#### Associations and Aggregate Methods

# - `VentureCapitalist#offer_contract` - DONE
#   - given a **startup object**, type of investment (as a string), and the amount
# invested (as a float), creates a new funding round and associates it with that
# startup and venture capitalist.

# - `VentureCapitalist#funding_rounds` - DONE
#   - returns an array of all funding rounds for that venture capitalist

# - `VentureCapitalist#portfolio` - DONE
#   - Returns a **unique** list of all startups this venture capitalist has funded

# - `VentureCapitalist#biggest_investment` - DONE
#   - returns the largest funding round given by this venture capitalist

# - `VentureCapitalist#invested` - DONE
#   - given a **domain string**, returns the total amount invested in that domain
