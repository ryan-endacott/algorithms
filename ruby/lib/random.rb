
# number of ways to get to step n if you can
# take k stairs in one step.  K is from pos_steps.
@@pos_steps = [1,2,3]
@@st_cache = Hash.new
def stairs(n)
  return 0 if n < 0
  return 1 if n == 0
  prevs = @@pos_steps.map {|p| stairs(n - p) }
  @@st_cache[n] ||= prevs.reduce(0, :+)
end


def perms(str)
  return [str] if str.length <= 1
  first = str[0]
  prevs = perms(str[1..-1])
  cur = []
  prevs.each do |prev|
    (0..prev.length).each do |i|
      cur.push(prev.dup.insert(i, first))
    end
  end
  return cur
end


# fewest coins to get amount n
# with coins in denominations of coin_values
def coins(sum, coin_values = [1, 5, 10, 25])
  min = Array.new(sum + 1, [Float::INFINITY, nil])
  min[0] = [0, nil] # base case
  
  (1..sum).each do |i|
    coin_values.each do |value|
      # if adding the current coin value
      # to a previously computed sum
      # gives us a new minimum
      # infinity because of nil case
      if value <= i and min[i - value].first < min[i].first
        min[i] = [min[i - value].first + 1, value]
      end
    end
  end

  return min[sum].first
end



require 'set'
def powerset(s)
  return nil if s.length <= 0
  return Set.new([s, nil]) if s.length == 1
  new_set = Set.new([s])
  s.each do |v|
    new_set.merge(powerset(s.dup.delete(v)))
  end
  return new_set
end


def to_bin(n)
  str_arr = []
  while n > 0
    str_arr.push(n % 2)
    n /= 2
  end
  return str_arr.join
end

def to_bin2(n)
  str_arr = []
  while n > 0
    str_arr.push(n & 1)
    n = n >> 1
  end
  return str_arr.join
end



