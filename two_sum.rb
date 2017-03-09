require 'byebug'

def bad_two_sum?(arr, target_sum)

  arr.each_index do |idx|
    arr.each_index do |idx2|
      next if idx == idx2
      return true if arr[idx] + arr[idx2] == target_sum
    end
  end
  false

end

def okay_two_sum?(arr, target_sum)
arr.sort!

a = 0
b = arr.length-1

while a != b
  current_sum = arr[a] + arr[b]
  if current_sum == target_sum
    return true
  elsif current_sum > target_sum
    b -= 1
  else
    a += 1
  end
end
false
end


# time: n^2, space: O(1)

def good_two_sum?(arr, target_sum)
  numbers_hash = Hash.new {0}

  arr.each do |num|
    numbers_hash[num] += 1
  end
  p numbers_hash
  numbers_hash.each do |key, val|
    number_we_need = target_sum - key
    p number_we_need
    return true if numbers_hash[number_we_need] > 0 && number_we_need != key 
  end
  false

end




arr = [-2, 0, 1, 5, 7, 8, 12]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false
# p okay_two_sum?(arr, 18) # true

# p good_two_sum?(arr, 6) # => should be true
# p good_two_sum?(arr, 10) # => should be false
# p good_two_sum?(arr, 18) # true
p good_two_sum?([0,1,5,7], 6) # true
p good_two_sum?([0,1,5,7], 10) # true
