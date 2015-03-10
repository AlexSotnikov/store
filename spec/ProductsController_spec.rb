require_relative 'spec_helper'
require_relative '../controller/ProductsController'

describe ProductsController do

  it "index" do
    expect(ProductsController.new.index).to eq(is_a?(String))
  end
  it "show" do
    expect(ProductsController.new.show).to eq(is_a?(String))
  end
    
end
