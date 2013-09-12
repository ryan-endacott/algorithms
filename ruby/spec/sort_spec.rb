require 'spec_helper'
require 'sort'


describe 'sorts' do
  describe 'mergesort' do
    it 'sorts an array' do
      a = [5, 8, 2, 3, 10, -5, 22, 30, 100, 19, 2, 3, 8, 7]
      b = mergesort(a.dup, 0, a.length - 1)
      a.sort.should == b
    end
  end

  describe 'quickselect' do
    it 'quickly selects 8th largest integer in a large list' do
      a = (1..10000).to_a.shuffle
      quickselect(a, 8).should == 8
    end
  end
end
