require 'spec_helper'
require 'hash_table'

describe HashTable do
  it 'works with one key and value' do
    h = HashTable.new
    h[:foo] = 'bar'
    h[:foo].should == 'bar'
  end
end
