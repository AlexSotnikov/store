class Order
  @@order={}
  @@n=1
  def add(product,name,adres,sub)
    @@order['$'+@@n.to_s]='name:'+name+' adres:'+adres+' cart:'+product.to_s+' sub:'+sub
    @@n+=1
  end
  def self.count
    @@order.size
  end
  def self.sub_all
    @sub=0
    for e in @@order 
      el=e[1].split('--').last
      @sub+=el.to_f
    end
    @sub
  end
  def self.delete_all
    @@order={}
  end
  def self.all_order
    @@order
  end 
end 
