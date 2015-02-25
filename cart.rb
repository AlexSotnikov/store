require_relative 'layout.rb'
class Cart
  include Lay
  extend Lay
  attr_accessor :name, :price
  @@cart=[]
  def initialize(name, price)
    @name=name; @price=price
  end
  def add
    @@cart << self
    self
  end
  def self.sub_total
    sum=0
    @@cart.each{|e| sum+=e.price.to_f}
    'sub total='+sum.to_s
  end
  def self.products
    s=' '
    @@cart.each do |e|
      s << '<b>'+e.name.to_s+'</b><i> price: '+e.price.to_s+'</i> <br/>'
    end
    unless s==' ' 
      s << Cart.sub_total+'<br/>'
      s << '<form method="POST" action="/cart">
          <button type="submit">delete cart</button>
          <input name="name" value="delete" type="hidden"></form></td><br/>'
    else
      s << 'Cart is empty<br/>'
    end
    layout{s}
  end
  def self.delete_all
    @@cart=[]
  end
end      
