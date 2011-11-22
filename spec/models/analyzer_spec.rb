require 'spec_helper'

describe Analyzer do
  
  #fixture :collectors, :prices
  
  before :each do
    date = Date.new(2008, 12, 29)
    @a = Analyzer.new(:name => '2008-12-29', :start_date => date, :end_date => date + 1.day, :ctw_id => 1, :quote_id => 1)
    @a.save
  end
  
  it 'should create Analyzer' do
    puts @a.inspect
  end
  
  it 'should calculate first action as expected' do
    price = 52.62
    #BUY
    action = @a.actions.first
    #action.cost.should == (-price)
    puts action.inspect
    puts Action.count
  end
end
