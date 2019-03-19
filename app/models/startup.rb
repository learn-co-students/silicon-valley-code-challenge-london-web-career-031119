class Startup

    attr_accessor :name, :founder, :domain
    

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        self.class.all << self
    end
    
    def self.all
        @@all
    end

    def pivot?(name, domain)
        @name = name
        @domain = domain
    end

    def self.find_by_founder (founder)
        all.find {|person| person.founder == founder }
    end

    def self.domains
        all.map {|x| x.domain}
    end

    def sign_contract(ventureCapitalist, type, investment)
        FundingRound.new(self, ventureCapitalist, type, investment)
    end

    def fundings #Use this to find only things for the startup in this instance. Very useful
        FundingRound.all.select {|x| x.startup == self}
    end

    def num_funding_rounds #Uses the above function and finds the length
        fundings.size
    end

    def total_funds
        fundings.map {|x| x.investment}.sum

        # FundingRound.all.select{|x| x.startup == self}   
        # # .map {|x| x.investment}.sum
    end

    def investors
        fundings.map {|x| x.ventureCapitalist}.uniq
    end

    def big_investors
        VentureCapitalist.tres_commas_club & investors #√√√√ Same as the stuff below
        # vcs = VentureCapitalist.tres_commas_club
        # vcs.select {|x| x.investors.include?(x)}
    end

end
