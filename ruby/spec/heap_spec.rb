require 'spec_helper'
require 'heap'

describe Heap do
  it 'should keep track of the min' do
    h = Heap.new
    h.insert(5)
    h.insert(8)
    h.insert(3)
    h.insert(-5)
    h.insert(15)
    h.min.should == -5
  end

  it 'should support heapsorting an array' do
    a = [5, 8, 19, -3, 4, 100, 10, -1, 5]
    b = a.dup
    Heap.heapsort(a).should == b.sort.reverse
  end

  it 'should support deleting everything' do
    h = Heap.new
    a = [1, 5, -3, 10, 13, 900, 23, -1, 0]
    h.insert(*a)
    a.sort.each do |v|
      h.delete_min.should == v
    end
  end

  it 'should support an insertion of multiple values' do
    h = Heap.new
    h.insert(20, 100, 3, 15, 10, 11, 9)
    h.min.should == 3
  end

  it 'should support deletion of the min and correct reordering' do
    h = Heap.new
    h.insert(20, 100, 3, -15, 10, 11, 9)
    h.delete_min.should == -15
    h.min.should == 3
  end

end

