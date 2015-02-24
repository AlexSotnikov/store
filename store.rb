require_relative 'product.rb'
require_relative 'layout.rb'
class MyStore
  include Lay
  def call(env)
    r=Rack::Request.new(env)
    case r.path
      when '/'
        [200,{'Content-Type' => 'text/html'},[Product.to_html]]
      when /^\/(\w+)$/
       a=Product.find($1)
       if a
         [200,{'Content-Type' => 'text/html'},[a.to_html]]
       else       
       [404,{'Content-Type' => 'text/html'},[layout{'Item not found'}]]
       end    
     end    
  end	
end
