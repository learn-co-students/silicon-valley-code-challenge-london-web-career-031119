class FundingRound

    attr_reader :startup, :VentureCapitalist, :type, :investment

    @@all = []
    #initiated methods
    def initialize(startup, venture_capitalist, type, investment)
        #belongs to other two models
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment > 0
        @@all << self
    end
    # class methods
    def self.all
        @@all
    end
end
