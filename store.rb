require_relative 'controller/CartController.rb'
require_relative 'controller/ProductsController.rb'
require_relative 'controller/OrderController.rb'
class MyStore
  def call(env)
    r=Rack::Request.new(env)
    product=r.params
    case env["REQUEST_METHOD"]
      when 'POST'
        case r.path
          when '/order'
            env['controller']=OrderController
            env['action']='accepted'     
          when ('/')
            unless env['Session']
              env['Session']=product['name']+'='+product['price']+','
            else
              env['Session'] << product['name']+'='+product['price']+','
            end            
            env['controller']=CartController
            env['action']='redirect'
          when '/cart'
            if product['name']=='delete'
              env['Session'] << 'delet,'
            end 
            env['controller']=CartController
            env['action']='redirect'  
        end
    when 'GET'
      case r.path
        when '/'
          env['controller']=ProductsController
          env['action']='index'
        when '/cart'
          env['controller']=CartController
          env['action']='index'
        when '/order'
          env['controller']=OrderController
          env['action']='index'
        when '/orderall'
          env['controller']=OrderController
          env['action']='show'
        when /^\/(\w+)$/
          env['name']=$1
          env['controller']=ProductsController
          env['action']='show'
       end
    end 
  env['controller'].new.call(env)
  end	
end

