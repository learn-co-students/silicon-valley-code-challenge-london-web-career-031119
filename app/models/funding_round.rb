class FundingRound

    attr_accessor :startup, :venture_capitalist, :type
    attr_reader :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = 0

        @@all << self

    end

    def investment=(inv)
        if inv < 0
            @investment = 0.to_f
        else
            @investment = inv.to_f
        end
    end

    def self.all
        @@all
    end

end
