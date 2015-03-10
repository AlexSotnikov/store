class Cart
  def self.sub_total(products)
    sum=0
    products.each do |e|
      el=e.split('=')
      sum=sum+el[1].to_f
    end
    'sub total is -- '+sum.to_s
  end
end      
