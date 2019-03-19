require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# startups (founder, name, domain)
 # sign_contract .find_by_founder .domains
 facebook = Startup.new("Zuck", "The Facebook", "social")
 amazon = Startup.new("Jeff", "Amazon", "retail")
 apple = Startup.new("Jobs", "Apple", "hardware")
 
 # venture_capitalist (name)
 sequoia = VentureCapitalist.new("Sequoia Capital", 41234134134)
 goldman = VentureCapitalist.new("Goldman Sachs", 412341234123512351)
 accel = VentureCapitalist.new("Accel", 41324512512524)
 falsy = VentureCapitalist.new("False", 4142)
 
 # funding (startup,venture_capitalist,type,investment)
  #all
 facebook.sign_contract(sequoia,"Round E","5000000")
 amazon.sign_contract(sequoia,"Round C","10000000")
 apple.sign_contract(goldman,"Round A","1500000")
 amazon.sign_contract(accel,"Round C","7500000")
 facebook.sign_contract(goldman,"Round D","2000000000")
 facebook.sign_contract(sequoia,"Round A","2000000")
 amazon.sign_contract(falsy, "Round A", "100")


binding.pry
0 #leave this here to ensure binding.pry isn't the last line