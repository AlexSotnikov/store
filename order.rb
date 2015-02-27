class Order
  include Lay
  extend Lay
  @@order={}
  def add(product,name)
  end
  def self.delete_all
  end
  def self.orders
  end
  def self.new_order
    s = '<form method="POST" action="/order">
         <input name="order" type="text">Your name<br/>
         <input name="adres" type="text">Your adress<br/>
         <input type="submit"></form>'
  end
end 
