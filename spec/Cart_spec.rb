require_relative 'spec_helper'
require_relative '../cart'

describe Cart do
  it "cart sub" do
    expect(Cart.sub_total(["Lenovo=6500","Sony=4800"])).to eq("sub total is -- 11300.0")
  end
end
