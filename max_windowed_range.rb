require 'byebug'
require_relative 'myqueue.rb'


def windowed_max_range(array, window_size)
  current_max_range = nil

  (0..(array.length - window_size)).to_a.each do |index|
    min = index
    max = window_size + index -1
    range = array[min..max]

    range_sum = range.max - range.min
    current_max_range ||= range_sum
    current_max_range = range_sum if current_max_range < range_sum
  end

  current_max_range
end


def wmr_queue(array, window_size)
  queue = MyQueue.new
  window_size.times do |i|
    queue.enqueue(array[i])
  end

  

end
