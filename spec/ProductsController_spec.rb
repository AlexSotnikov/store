require_relative 'spec_helper'
require_relative '../controller/ProductsController'

describe ProductsController do

  it "index" do
    expect(ProductsController.new.index)
  end
  it "show" do
    expect(ProductsController.new.show)
  end
    
end
