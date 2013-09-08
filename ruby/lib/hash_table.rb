require_relative 'linked_list'

class HashTable

  def initialize(capacity = 10)
    @capacity = capacity
    @array = Array.new(capacity)
    @count = 0
  end

  def [](key)
    h = hash(key)
    list = @array[h] || LinkedList.new
    list.get(key)
  end

  def insert(key, value)
    increase_capacity if @count > @capacity
    h = hash(key)
    list = @array[h] || LinkedList.new
    list.insert_or_update(key, value)
    @array[h] = list
  end

  alias_method :[]=, :insert

  private

    def increase_capacity(factor = 2)
      @capacity *= factor
      old_array = @array
      @array = Array.new(@capacity)
      old_array.each do |list|
        if list
          list.each do |node|
            insert(node.key, node.value)
          end
        end
      end
    end

    # Trivial hash algorithm by adding char values
    def hash(key)
      key.to_s.chars.map(&:ord).inject(:+) % @capacity
    end
end
