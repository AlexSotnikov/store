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
    redirect_to('/')
  end
end
