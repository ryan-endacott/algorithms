require './linked_list'

class HashTable

  def initialize(capacity = 10)
    @capacity = capacity
    @array = Array.new(capacity)
  end

  def [](key)
    h = hash(key)
    list = @array[h]
    list[key]
  end

  def []=(key, value)
    h = hash(key)
    list = @array[h] || LinkedList.new
    list.insert_or_update(key, value)
  end

  private

    # Trivial hash algorithm by adding char values
    def hash(key)
      key.to_s.chars.map(&:ord).inject(:+) % @capacity
    end
end
