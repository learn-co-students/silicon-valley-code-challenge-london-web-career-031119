class Startup
#> the domain can be seen but not chaned 
attr_reader :name, :founder, :domain
@@all = []
    def initialize(name,founder,domain)
    @name = name 
    @founder = founder 
    @domain = domain
    self.class.all << self 
end

def pivot(domain,name)
    @name = name 
    @domain = domain 
end

def self.all
    @@all
end

def self.find_by_founder(name)
    all.detect do |x| x.founder == name
    end
end

def self.domains
    all.map do |x| x.domain 
    end
    end

    def sign_contract(venture_capitalist,funding_round,investment_amount)
        FundingRound.new(self,venture_capitalist,funding_round,investment_amount)
    end

    def num_funding_rounds 
        FundingRound.all.select {|x| x.startup == self }.count
    end

    def total_funds

    end


end

# startup name √
# startup founder √
# startup domain √
# startup pivot √
# startup all √
# sign_contract √
# num_funding_rounds √
FundingRound.all.map do  
    |x| 
    if x.startup == s2 
        x.investment
    end 
end