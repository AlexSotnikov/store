require_relative 'product.rb'
require_relative 'layout.rb'
require_relative 'cart.rb'
require_relative 'order.rb'
class MyStore
  include Lay
  def call(env)
    r=Rack::Request.new(env)
    if env["REQUEST_METHOD"]=='POST'     
      product=r.params
      if product['name']=='delete'
        Cart.delete_all(env['Set'].to_s)
        [200,{'Content-Type' => 'text/html'},[Cart.products(env['Set'])]]
      else
        Cart.new(env['Set']).add(product)
        [200,{'Content-Type' => 'text/html'},[Product.to_html(env['session'])]]
      end
    else
    case r.path
      when '/'
        c=env['Set']
        if c
          [200,{'Content-Type' => 'text/html','Set-Cookie' =>'id='+c+'; path=/'},[Product.to_html(env['session'])]]
        else
          [200,{'Content-Type' => 'text/html'},[Product.to_html(env['session'])]]
        end
      when '/cart'
        [200,{'Content-Type' => 'text/html'},[Cart.products(env['Set'])]]
      when '/order'
        [200,{'Content-Type' => 'text/html'},[Order.new_order]]
      when /^\/(\w+)$/
       a=Product.find($1)
       if a
         [200,{'Content-Type' => 'text/html'},[a.to_html]]
       else       
        [404,{'Content-Type' => 'text/html'},[layout{"Item not found</br>"}]]
       end           
     end
    end    
  end	
end
