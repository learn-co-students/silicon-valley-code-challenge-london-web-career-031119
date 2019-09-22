class FundingRound

    attr_accessor :startup, :ventureCapitalist, :type, :investment

    @@all = []
    
    def initialize(startup, ventureCapitalist, type, investment)
        @startup = startup
        @ventureCapitalist = ventureCapitalist
        @type = type
        @investment = investment
        self.class.all << self
    end
        
    def self.all
        @@all
    end

end
