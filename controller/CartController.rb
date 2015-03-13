require_relative '../cart.rb'
require_relative 'controler.rb'
class CartController < Controller
  @@layout='view/layout.html.erb'
  def index
    products=session
    if products!=' '
      @prod=products.split(',')     
    else
      @prod=nil
    end
    render('view/cart',@@layout)
  end
  def redirect
    if params['name']=='delete'
      session << 'delet,'
    else
      unless session
        session=params['name']+'='+params['price']+','
      else
        session{ params['name'] +'='+params['price']+','}        
      end
    end            
    redirect_to('/')
  end
end
