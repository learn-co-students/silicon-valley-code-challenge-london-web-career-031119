

class FundingRound
attr_reader :startup, :venture_capitalist,:type, :investment
@@all = []
    def initialize( startup, venture_capitalist, type, investment)
        @startup = startup 
        @venture_capitalist = venture_capitalist
        @type= type
        @investment = investment
        self.class.all << self 
    end
    def self.all
        @@all 
    end


end

# FundingRound#startup √
# I should not be able to change the startup
      
# FundingRound#venture_capitalist √
# I should not be able to change the venture capitalist

# FundingRound#type  √
# Examples include: Angel, Pre-Seed, Seed, Series A, 
# Series B, Series C, etc.

# FundingRound#investment √

# FundingRound.all √