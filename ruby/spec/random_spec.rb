require 'spec_helper'
require 'random'
require 'set'

describe 'stairs' do

  it 'should get to lots of stairs correctly' do
    stairs(1).should == 1
    stairs(2).should == 2
    stairs(3).should == 4
  end

  it 'should get steps to 4 stairs right' do
    stairs(4).should == 7
  end
end


describe 'perms' do
  it 'gets perms of abc' do
    perms('abc').sort.should == ['abc', 'acb', 'bca', 'bac', 'cab', 'cba'].sort
  end
end


describe 'coins' do

  it 'should give 1 coin for 25' do
    coins(25).should == 1
  end

  it 'should give 3 coins for 16' do
    coins(16).should == 3
  end

  it 'should work with different coin values [1]' do
    coins(10, [1]).should == 10
  end

  it 'should work with different coin values [3, 6, 9, 14]' do
    coins(18, [3, 6, 9, 14]).should == 2
  end
end



describe 'powerset' do
  it 'should work for length 1' do
    a = Set.new([1])
    powerset(a).should == Set.new([Set.new([1]), nil])
  end
  
  it 'should work' do
    a = Set.new([1, 2, 3])
    b = [[1], [2], [3], [1, 2], [2, 3], [1, 3], [1, 2, 3]]
    b.map!{ |v| v.to_set }
    b = Set.new(b)
    b.add(nil)
    powerset(a).should == b
  end
end



