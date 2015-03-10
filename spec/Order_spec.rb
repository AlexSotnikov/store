require_relative 'spec_helper'
require_relative '../order'

describe Order do
let(:product){Order.new.add("Lenovo=6500,Sony=4800","den","123asd","sub total is -- 11300.0")}
  it "order add" do
    expect{product}.to change{Order.count}.from(0).to(1)
  end
  it "sub_all" do
    product
    product
    expect(Order.sub_all).to eq(22600.0)
  end
    
end
