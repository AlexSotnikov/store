require_relative 'layout.rb'
class Cart
  include Lay
  extend Lay
  @@cart=[]
  def initialize(token)
    @token=token.to_s
  end
  def add(product)
    @@cart << [@token.to_s,product['name'],product['price']]
  end
  def self.sub_total(token)
    sum=0
    @@cart.each do |e| 
       if e[0]==token
         sum+=e[2].to_f
       end
    end
    'sub total is -- '+sum.to_s
  end
  def self.products(token)
    s=' '
    @@cart.each do |e|
      if e[0]==token
       s << '<b>'+e[1].to_s+'</b><i> price: '+e[2].to_s+'</i> <br/>'
      end
    end
    unless s==' ' 
      s << Cart.sub_total(token).to_s+'<br/>'
      s << '<form method="POST" action="/cart">
          <button type="submit">delete cart</button>
          <input name="name" value="delete" type="hidden"></form>'
          
      s <<'<form method="GET" action="/order">
          <button type="submit">BUY</button></form><br/>'
    else
      s << 'Cart is empty<br/>'
    end
    layout{s}
  end
  def self.delete_all(token)
    @@cart=@@cart.select{|e| e[0]!=token}
  end
end      
