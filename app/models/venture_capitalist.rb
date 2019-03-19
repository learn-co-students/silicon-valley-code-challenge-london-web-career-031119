class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        self.class.all << self
    end
    
    def self.all
        @@all
    end
    
    def self.tres_commas_club
        all.select{|x| x.total_worth.delete(',').to_i >= 1000000000 }
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds #similar to before - find your own obkects and use it below
        FundingRound.all.select {|x| x.ventureCapitalist == self}
    end

    def biggest_investment # biggest investment number
        funding_rounds.max_by {|x| x.investment}
    end

    def num_funding_ground # number of investments by one person
        funding_rounds.length
    end

    def portfolio 
        funding_rounds.map {|x| x.startup}.uniq
    end

    def obj(domain_str)
        Startup.all.select {|x| x.domain == domain_str}
    end

    # def invested (domain_str)
    #     FundingRound.all.select {|x| x.startup.include?(obj(domain_str))}
    # end

end
