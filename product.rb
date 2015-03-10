class Product
  attr_accessor :name, :price, :img, :info
  @@products=[]
  def initialize(name, price, img, info )
    @name=name; @price=price; @img=img; @info=info
  end
  def save
    @@products << self
    self
  end
  def self.count
    @@products.size
  end
  def self.purge
    @@products=[]
  end 
  def self.find(names)
    @@products.detect do |el|
      el.name.downcase==names.downcase
    end  
  end 
  def self.all
    @@products
  end
end
