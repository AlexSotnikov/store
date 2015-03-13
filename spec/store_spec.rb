require_relative 'spec_helper'
require_relative '../store'
require 'rack'
describe MyStore do
  it 'call' do
    expext(MyStore.new.call({}))
  end
end
  
