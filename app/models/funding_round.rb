# FundingRound belongs to a venture_capitalist
# FundingRound belongs to a startup

class FundingRound

  attr_reader :startup, :venture_capitalist, :type, :amount_investment

  @@all = []

  def initialize(startup, venture_capitalist, type, amount_investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @amount_investment = amount_investment > 0 ? amount_investment : 0

    @@all << self

  end

  def self.all
    @@all
  end



end



# - `FundingRound#startup` - DONE
#   - returns the startup object for that given funding round
#   - Once a funding round is created, I should not be able to change the startup

# - `FundingRound#venture_capitalist` - DONE
#   - returns the venture capitalist object for that given funding round
#   - Once a funding round is created, I should not be able to change the venture capitalist

# - `FundingRound#type`- DONE
#   - returns a **string** that is the type of funding round
#   - Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.

# - `FundingRound#investment` - DONE
#   - returns a **number** that is the amount invested during this funding round
#   - This should be a float that is not a negative number.

# - `FundingRound.all` - DONE
#   - returns all of the funding rounds
