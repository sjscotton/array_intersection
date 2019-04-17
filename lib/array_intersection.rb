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
  new_array = []
  longer.length.times do |index|
    new_array << longer[index] if binary_search(shorter, shorter.length, longer[index])
  end
  return new_array
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
