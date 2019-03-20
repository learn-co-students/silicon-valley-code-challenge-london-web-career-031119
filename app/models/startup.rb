class Startup

    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []
    #initiated methods
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
    # class methods
    def self.all
        @@all
    end

    def self.find_by_founder(founder_name) #returns first result
        all.find { |x| x.founder == founder_name }
    end

    def self.domains #returns all of the array
        all.collect { |x| x.domain }
    end

    def sign_contract(venture_capitalistc, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def fundings
        FundingRound.all.select {|x| x.startup == self}
        
    end

    def num_funding_rounds
        # FundingRound.all.select { |rounds| rounds.startup == self }.length
        fundings.size
    end

    def total_funds
        # FundingRound.all.collect { |rounds| rounds.investment == self }.sum
        fundings.map {|x| x.investment}.sum
    end

    def investors
        # FundingRound.all.map {|invested| invested.venture_capitalist == self }.uniq  
        fundings.map {|x| x.venture_capitalist}.uniq

    end

    def big_investors
        # FundingRound.all.map {|x| x.venture_capitalist == self && invested.venture_capitalist == venture_capitalist.tres_commas_club}  
        VentureCapitalist.tres_commas_club & investors   
    end
end