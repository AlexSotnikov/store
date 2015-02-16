class Product
  attr_accessor :name, :price, :img
  @@products=[]
  def initialize(name, price, screen_size, system, memory, camera, img )
    @name=name; @price=price; @screen_size=screen_size
    @system=system; @memory=memory; @camera=camera; @img=img
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
  def self.to_html
    s='<html> <head> <title> My Store </title> </head> <body bgcolor="yellow"> <br />'
    @@products.each do |e| 
    s << '<div align="center"><b> '+e.name+'</b> <br /><i> price: '+e.price.to_s+'</i><br /> <img src='+e.img+'> </div>'
    end
		s << '</body> </html>'         
  end
  def self.find(names)
    for el in(@@products) 
      if el.name.downcase==names.downcase
        find=el
      end
    end
    if find==nil
      find=names
    else
      find
    end
  end
  def to_html
    s='<html> <head> <title> My Store </title> </head> <body bgcolor="yellow"> <br />'
    s << '<b> '+@name+'</b> <br /> <i> Price:  '+@price.to_s+'</i> <br />'
    s << 'Screen size:-> '+@screen_size.to_s+'" <br/><i> System:-> '+@system+'</i> <br/>'
    s << 'Memory:-> '+@memory.to_s+'Gb <br /> <i> Camera:-> '+@camera.to_s+'Mpx</i><br/>'
    s << '<img src='+@img+'>'
		s << '</body> </html>'         
  end  
end
class MyStore
  def call(ehv)
    q=ehv['QUERY_STRING']
    name=q.split('=').last
     if name 
       a=Product.find(name)
       if a.is_a?(String)
         [200,{'Content-Type' => 'text/html'},['<html> <head> <title> My Store </title> </head> <body bgcolor="yellow"> <br /><div align="center"><b> PRODUCT<i> '+a.to_s+' </i>IS NO</b></div></body> </html>']]
       else       
       [200,{'Content-Type' => 'text/html'},[a.to_html]] 
       end
     else
       [200,{'Content-Type' => 'text/html'},[Product.to_html]]
     end     
  end	
end



