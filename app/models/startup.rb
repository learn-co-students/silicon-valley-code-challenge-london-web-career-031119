class Startup
    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        Startup.all << self
    end

    def self.all
        @@all
    end

    def self.domains
        Startup.all.map { |startup| startup.domain }.uniq
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(founder_name)
        Startup.all.find { |startup| startup.founder == founder_name }
    end

    def sign_contract(venture_capitalist, investment_type, amount)
        FundingRound.new(self, venture_capitalist, investment_type, amount)
    end

    def get_funding_rounds
        FundingRound.all.select{ |funding| funding.startup == self }
    end

    def num_funding_rounds
        get_funding_rounds.size
    end

    def total_funds
        total = 0
        get_funding_rounds.each { |funding| total += funding.investment }
        total
    end

    def investors
        get_funding_rounds.map { |funding| funding.venture_capitalist }.uniq
    end

    def big_investors
        VentureCapitalist.tres_commas_club & self.investors
    end
end