class VentureCapitalist
    @@all = []
attr_accessor :name, :total_worth
def initialize(name,total_worth)
    @name = name
    @total_worth = total_worth
    self.class.all << self 
end

def self.all 
    @@all
end
# > this code works assumes the user will place the commas in the right place when initiaizing
# total net worth
 def self.tres_commas_club 
all.select {|x| x.total_worth.split(",").count >= 4 }.map{|x| x.name }
 end

end

# VentureCapitalist#name   √
# returns a string that is the venture capitalist's name

# VentureCapitalist#total_worth   √
# returns a number that is the total worth of this investor (e.g., think of it as how much money they have)

# VentureCapitalist.all √
# returns an array of all venture capitalists 

# VentureCapitalist.tres_commas_club √
# returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)