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

def largest_contiguous_subsum(arr) #n^2 + n^3 => n^3
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

def lcs(arr)
  largest_sum = arr.inject(:+)
  sum = largest_sum
  left_index = 0
  right_index = (arr.length - 1)
  until right_index == left_index
    if arr[left_index] > arr[right_index]
      sum -= arr[right_index]
      right_index -= 1
    else
      sum -= arr[left_index]
      left_index += 1
    end
    largest_sum = sum if largest_sum < sum
  end

  largest_sum
end
