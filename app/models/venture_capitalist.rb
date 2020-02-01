class VentureCapitalist

    attr_accessor :name, :worth

    @@all = []

    def initialize(name, worth)
        @name = name
        @worth = worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select {|person| person.worth > 1000000000}
    end

    def offer_contract(startup, type, invest)
        # Creates a new funding round and associates it with that startup and venture capitalist.
        FundingRound.new(startup, self, type, invest)
    end

    def funding_rounds
        # Returns an array of all funding rounds for that venture capitalist
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        # Returns a unique list of all startups this venture capitalist has funded
        funding_rounds.map {|round| round.startup}.uniq
    end

    def biggest_investment
        # Returns the largest funding round given by this venture capitalist
        max = 0
        funding_rounds.each do |round| 
            if round.investment > max
                max = round.investment
            end
        end
        max
    end

    def invested(domain)
        res = 0
        total = funding_rounds.select {|round| round.domain = domain}
        total.each {|item| res += item.investment}
    end

end
