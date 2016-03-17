require 'byebug'

def my_min(arr) #O(n^2)
  arr.each do |el|
    smallest = true
    arr.each do |el2|
      smallest = false if el > el2
    end
    return el if smallest == true
  end
end

def my_min2(arr) #O(n)
  smallest = arr.shift
  arr.each do |el|
    smallest = el if el < smallest
  end
  smallest
end

def largest_contiguous_subsum(arr) #n^2 + n => n^2
  subarrays = []
  arr.each_index do |i|
    j = i
    while j < arr.length
      subarrays << arr[i..j]
      j += 1
    end
  end

  largest_sum = nil
  subarrays.each do |sub_array|
    sum = sub_array.inject(:+)
    if largest_sum == nil || sum > largest_sum
      largest_sum = sum
    end
  end

  largest_sum
end

# def largest_contiguous_subsum2(arr)
#   largest_sum = arr.first
#   partial_sum = nil
#   arr.each_with_index do |el,i|
#     #would it be less
#     if partial_sum.nil?
#       partial_sum = el
#     else
#       partial_sum += el
#     end
#     if largest_sum < partial_sum
#       largest_sum = partial_sum
#     end
#     partial_sum = nil if el < 0
#   end
#   largest_sum
#
# end

def LCS(arr)
  largest_sum = arr.first
  partial_sums = []
  idx = 0

  arr.each do |el|
    idx += 1 if el < 0
    if partial_sums[idx] == nil
      partial_sums[idx] = el
    else
      partial_sums[idx] += el
    end
    idx += 1 if el < 0
  end
  byebug
  new_sums = []
  idx2 = 0
  negative_count = 0
  partial_sums.each do |el|

    negative_count += 1 if el < 0
    idx2 += 1 if negative_count == 2
    if new_sums[idx2] == nil
      new_sums[idx2] = el
    else
      new_sums[idx2] += el
    end
  end

  final = new_sums + partial_sums
  final.max
  # accumulator = partial_sums.shift
  # partial_sums.each do |partial|
  #   accumulator = partial + accumulator
  #   largest_sum = accumulator if accumulator > largest_sum
  # end

end
