def my_min_1(arr)

  arr.each_with_index do |el, i1|
    found_min = true

    arr.each_with_index do |el2, i2|
      next if i1 == i2
      found_min = false if el > el2
    end
    return el if found_min
  end

end

#time complexity: n * n == n^2



def my_min_2(arr)

  min = arr.first

  arr.each do |el|
    min = el if el < min
  end
  min

end

#time complexity: n


p my_min_1([ 0, 3, 5, 4, -5, 10, 1, 90 ])
p my_min_2([ 0, 3, 5, 4, -5, 10, 1, 90 ])

def largest_contiguous_subsum_1(array)
  sub_arrays = []

  array.each_with_index do |el1, i1|
    array.each_with_index do |el2, i2|
      sub_array = array[i1..i2]
      sub_arrays << sub_array unless sub_array.empty?
    end
  end
  largest_sum = nil

  sub_arrays.each do |ele|
    current_sum = ele.inject(&:+)
    largest_sum = current_sum if largest_sum.nil? || current_sum > largest_sum
  end
  largest_sum
end

#time complexity: n^2 + n^2 == 2n^2 == n^2

def largest_contiguous_subsum_2(array)
  largest_sum = array.first
  current_sum = largest_sum

  array.each_index do |idx|
    next if idx == 0
    current_sum = current_sum + array[idx]
    current_sum = 0 if current_sum < 0
    largest_sum = current_sum if current_sum > largest_sum
  end
  largest_sum
end

list = [5, 3, -7, 1]

p largest_contiguous_subsum_1(list)
p largest_contiguous_subsum_2(list)
