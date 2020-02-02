class VentureCapitalist
    attr_reader :name
    attr_accessor :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        VentureCapitalist.all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select do |capitalist|
            capitalist.total_worth > 1000000000
        end
    end

    def offer_contract(startup, investment_type, amount)
        FundingRound.new(startup, self, investment_type, amount)
    end

    def funding_rounds
        FundingRound.all.select { |funding| funding.venture_capitalist == self }
    end

    def portfolio
        funding_rounds.map { |funding| funding.startup }.uniq
    end

    def biggest_investment
        funding_rounds.sort_by { |funding| funding.investment }.last
    end

    def invested(domain)
        total = 0
        funding_rounds.each do |funding|
            total += funding.investment if funding.startup.domain == domain
        end
        total
    end

end

# VentureCapitalist#offer_contract
# given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.

# VentureCapitalist#funding_rounds
# returns an array of all funding rounds for that venture capitalist

# VentureCapitalist#portfolio
# Returns a unique list of all startups this venture capitalist has funded

# VentureCapitalist#biggest_investment
# returns the largest funding round given by this venture capitalist

# VentureCapitalist#invested
# given a domain string, returns the total amount invested in that domain
