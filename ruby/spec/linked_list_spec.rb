require 'spec_helper'
require 'linked_list'

describe LinkedList do
  describe 'works as a simple key value' do
    it 'works with multiple values' do
      l = LinkedList.new
      l.insert(:a, 5)
      l.insert(:b, 7)
      l.insert(:d, 9)
      l.insert(:hi, 5)
      l.get(:b).should == 7
    end
    it 'works with one value' do
      l = LinkedList.new
      l.insert(:a, 5)
      l.get(:a).should == 5
    end
  end

  describe '#insert_or_update' do
    it 'updates the value' do
      l = LinkedList.new
      l.insert(:a, 5)
      l.insert(:b, 8)
      l.insert_or_update(:a, 10)
      l.get(:a).should == 10
    end

    it 'does not insert a new value when already exists' do
      l = LinkedList.new
      l.insert(:a, 5)
      l.insert(:b, 8)
      l.insert_or_update(:a, 10)
      l.length.should == 2
    end
  end

  describe '#remove' do
    it 'successfully removes the value' do
      l = LinkedList.new
      l.insert(:hello, 'world')
      l.get(:hello).should == 'world'
      l.remove(:hello)
      l.get(:hello).should be_nil
    end
  end
end



