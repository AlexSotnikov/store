require_relative 'spec_helper'
require_relative '../product'
describe Product do
  let(:product){Product.new("Lenovo", 6500,"http","android 4.2, dispay 5,memory 8 GB")}
  before {Product.purge}
  it "counts product" do
    expect{product.save}.to change{Product.count}.from(0).to(1)
  end 
  it "return all" do
    expect(Product.all).to eq([])
    product.save
    expect(Product.all).to eq([product])
  end
  it "find product name" do
    product.save
    product.should eq(Product.find("lenovo"))
    Product.find("xxx").should eq(nil)
  end
end
