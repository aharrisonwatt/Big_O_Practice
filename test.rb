def LCS(arr)
  largest_sum = arr.inject(:+)
  sum = largest_sum
  while arr.length > 1
    if arr[0] > arr[-1]
      sum -= arr.pop
    else
      sum -= arr.shift
    end
    largest_sum = sum if largest_sum < sum
  end

  largest_sum
end
