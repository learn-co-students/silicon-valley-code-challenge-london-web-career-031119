class FundingRound

  attr_accessor :type, :investment
  attr_reader :startup, :venture_capitalist

  @@all = []

  def initialize(startup_Object, vc_Object, type_String, investment_Float)
    @startup = startup_Object
    @venture_capitalist = vc_Object
    @type = type_String
    if investment_Float >= 0
      @investment = investment_Float
    else
      @investment = 0
    end
    @@all << self    
  end
  
  def self.all
    @@all
  end

end
