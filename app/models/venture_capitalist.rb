class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []
    #initiated methods
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        self.class.all << self
        #can change name
    end
    # class methods
    def self.all
        @@all
    end

    def self.tres_commas_club
        # if self.total_worth == 1,000,000,000 
        #     VentureCapitalist.all.collect { |x| x.total_worth }
        # end
        all.select{|x| x.total_worth >= 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def num_funding_ground
        FundingRound.all.select { |x| x.VentureCapitalist == self }
    end

    def funding_rounds
        num_funding_ground.length
    end

    def portfolio
        # FundingRound.all.map {|x| x.startup == self }.uniq
        num_funding_ground.map {|x| x.startup}.uniq
    end

    def biggest_investment
        # FundingRound.all.collect {|x| x.startup == self }.sum
        num_funding_ground.max_by {|x|.investment}
    end

    def invested(domain_string)
        funding_rounds.select { |i| i.startup.domain == domain_string 
              
    end

    # def invested (domain_str)
    #     arr = []
    #     # funding_rounds.select do |x| # if you only want to check against the instance
    #     obj = FundingRound.all.select {|x| x.ventureCapitalist} # using this one will check against all instances that have ever been created
    #     obj.select do |x|
    #     if x.startup.domain == domain_str
    #          arr << x.investment
    #     end
    #     end
    #     arr
    # end
end
