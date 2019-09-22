class Startup
  attr_accessor :name, :domain, :founder

  @@all = []


  def initialize (name, founder, domain = "Not Provided")
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
  @@all
  end


  def self.find_by_founder(founder_check)
   Startup.all.find {|i| i.founder.downcase == founder_check.downcase}
  end

  def self.domains
    Startup.all.map {|i| i.domain}
  end

  def pivot(domain_check, name_check)
    change_domain = Startup.all.find {|i| i.founder.downcase == name_check.downcase && i.domain.downcase == domain_check.downcase}
    if change_domain
      puts "Instert new domain"
      new_domain = gets.chomp
      @domain = new_domain
    else
     return "No Match"
   end
 end

   def sign_contract(vent_capitalist, investment, ammount_invested)
   temp_capitalist = VentureCapitalist.all.find {|i| i == vent_capitalist}
   if temp_capitalist
     FundingRound.new(self, temp_capitalist, investment, ammount_invested)
   else
     return "Incorrect Information Given"
   end
 end

   def num_funding_rounds
    temp_rounds = FundingRound.all.map {|i| i.startup == self}
    temp_final = temp_rounds.select {|i| i == true}
    temp_final.length
   end

   def total_funds
     temp_total = FundingRound.all.select {|i| i.startup == self}
     final_total = temp_total.map {|i| i.ammount_invested}
     final_total.inject(0){|sum,x| sum + x }

   end

   def investors
     temp_vent = FundingRound.all.select {|i| i.startup == self}
     final_vent = temp_vent.map {|i| i.vent_capitalist.name}
     final_vent.uniq

   end

   def big_investors
     temp_vent = FundingRound.all.select {|i| i.startup == self}
     mid_vent = temp_vent.select {|i| i.vent_capitalist.tcc = true}
     final_vent = mid_vent.map {|i| i.vent_capitalist.name}
     final_vent.uniq
   end

 end
