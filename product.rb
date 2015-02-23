require_relative 'layout.rb'
class Product
  include Lay
  extend Lay
  attr_accessor :name, :price, :img
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
  def self.all
    @@products
  end
  def self.purge
    @@products=[]
  end 
  def self.find(names)
    @@products.detect do |el|
      el.name.downcase==names.downcase
    end  
  end
  def to_html
    layout do
      s='<b> '+@name.to_s+'</b> <br /><i> Price: '+@price.to_s
      s <<'</i><br/> <img src='+@img.to_s+'><br/><i> Info: '+@info.to_s+'</i><br/>'
    end		       
  end
  def self.to_html
    s="<table> "
    @@products.each do |e| 
      s << '<td align="center"><br/><b>'+e.name.to_s+'</b> <br/> <i> price: '+e.price.to_s+'</i> <br/>'
      s << '<a href="http://localhost:9292/'+e.name.to_s.downcase+'"> <img src='+e.img.to_s+'></a></td><br/>'
    end
    s << '</table>'
      layout do 
        s
      end
  end
end


