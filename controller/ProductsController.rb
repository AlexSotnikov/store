require_relative '../product.rb'
require_relative 'controler.rb'
class ProductsController < Controller
  @@layout='view/layout.html.erb'

  def index
    @products = Product.all
    render('view/product',@@layout)
  end
  def show
    prod = Product.find(@env['name'])
    @product={'name'=>prod.name,'price'=>prod.price,'img'=>prod.img,'info'=>prod.info}
    render('view/product1',@@layout)
  end
end
