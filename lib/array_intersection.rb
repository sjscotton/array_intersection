# Returns a new array to that contains elements in the intersection of the two input arrays
# Time complexity: ?
# Space complexity: ?
def intersection(array1, array2)
  return [] if array1 == nil || array2 == nil
  if array1.length < array2.length
    array1.sort!
    shorter = array1
    longer = array2
  else
    array2.sort!
    shorter = array2
    longer = array1
  end
  # array1.length < array2.length ? array1.sort! : array2.sort!
  # array1.length < array2.length ? shorter = array1 && longer = array2 : shorter = array2 && longer = array1
  new_array = []
  longer.length.times do |index|
    new_array << longer[index] if binary_search(shorter, shorter.length, longer[index])
  end
  return new_array
  # array1.sort!
  # new_array = []
  # array2.length.times do |index|
  #   puts binary_search(array1, array1.length, array2[index])
  #   new_array << array2[index] if binary_search(array1, array1.length, array2[index])
  # end
  # return new_array
end

def binary_search(array, length, value_to_find)
  high = length
  low = 0
  length.times do
    guess = (low + high) / 2
    return true if array[guess] == value_to_find
    return false if high - low <= 1
    array[guess] < value_to_find ? low = guess : high = guess
  end
  return false
end

array1 = [1, 3, 6, 8, 4, 9, 5, 11, 14, 16]
array2 = [3, 8, 2, 5, 11, 15]

array1 = []
array2 = [70, 90, 34, 21, 78, 42]

puts intersection(array1, array2)
