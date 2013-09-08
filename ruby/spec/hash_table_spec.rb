require 'spec_helper'
require 'hash_table'

describe HashTable do
  it 'works with one key and value' do
    h = HashTable.new
    h[:foo] = 'bar'
    h[:foo].should == 'bar'
  end

  describe 'capacity doubling' do
    it 'should still keep contents if initial capacity is exceeded' do
      h = HashTable.new
      (1...100).each do |num|
        h[num] = num
      end

      (1...100).each do |num|
        h[num].should == num
      end
    end
  end
end
