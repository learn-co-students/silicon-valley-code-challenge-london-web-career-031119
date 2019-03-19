require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Tempest","Fernando","www.tempest.com")
s2 = Startup.new("Pizzahut","John","www.t.com")   
# s3 = Startup.new("Dominos","Harry","www.upyours.com")
v1 = VentureCapitalist.new("Mark", "1,0000,000,000")
v2 = VentureCapitalist.new("Roach", "100,000,000")
# v3 = VentureCapitalist.new("Lopez", "21,0000,000,000")
# v1 = VentureCapitalist.new("Steve", "400,000")

s1.sign_contract(v1,"serie a", "5000",)
s2.sign_contract(v2,"serie b", "100",)
s1.sign_contract(v2,"serie a", "900")
binding.pry
0 #leave this here to ensure binding.pry isn't the last line