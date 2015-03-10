require_relative '../order.rb'
require_relative 'controler.rb'
class OrderController < Controller
  @@layout='view/layout.html.erb'

  def index
    product = session
    if product
      @prod=product.split(',')
    else
      @prod=' '
    end
    render('view/order',@@layout)
  end
  def show
    @prod = Order.all_order
    render('view/orders',@@layout)
  end
  def accepted
    Order.new.add(session,params['order'],params['adres'],params['sub'])
    session << 'delet,'
    @text = 'order accepted'
    render('view/orders',@@layout)
  end
end
