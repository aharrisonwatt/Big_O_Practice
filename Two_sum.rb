#time => O(n^2)
#space => O(1)
def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |num, i|
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target_sum
      j += 1
    end
  end
  false
end

#time => O(n log n)
#space = > O(n)
def okay_two_sum?(arr, target_sum)
  sorted_arr = arr.sort
  right_index = arr.length - 1
  left_index = 0

  while right_index != left_index
    current_sum = sorted_arr[left_index] + sorted_arr[right_index]
    return true if current_sum == target_sum
    if current_sum < target_sum
      left_index += 1
    else
      right_index -= 1
    end
  end

  false
end

def two_sums?(arr,target_sum)
  values = Hash.new(false)

  arr.each do |key|
    difference = target_sum - key
    values[key] = difference
    return true if values[difference] == key
  end

  false
end
