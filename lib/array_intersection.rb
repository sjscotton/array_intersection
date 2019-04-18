# Returns a new array to that contains elements in the intersection of the two input arrays
# Time complexity: O(n) where n is the length of the longer array
# Space complexity: O(n) where n is the length of shorter array.
# its 2n, because of the space of the hash is linear to the shorter array, and the
# intersection array space is also linear to the smaller array

def intersection(array1, array2)
  return [] if array1 == nil || array2 == nil
  if array1.length < array2.length
    shorter = array1
    longer = array2
  else
    shorter = array2
    longer = array1
  end
  num_hash = Hash.new
  intersection_array = []
  shorter.length.times do |index|
    num_hash[shorter[index]] = 1
  end
  longer.length.times do |index|
    intersection_array << longer[index] if num_hash[longer[index]]
  end

  return intersection_array
end

# SORTING SOLUTION

# Returns a new array to that contains elements in the intersection of the two input arrays
# Time complexity: O(n log n) where n is the size of the smaller array,
# this is because the highest time complexity is the sruby sort method, which it n log n
# Space complexity: O(n) where n is the length of the smaller array

# def intersection(array1, array2)
#   return [] if array1 == nil || array2 == nil
#   if array1.length < array2.length
#     array1.sort!
#     shorter = array1
#     longer = array2
#   else
#     array2.sort!
#     shorter = array2
#     longer = array1
#   end
#   new_array = []
#   longer.length.times do |index|
#     new_array << longer[index] if binary_search(shorter, shorter.length, longer[index])
#   end
#   return new_array
# end

# def binary_search(array, length, value_to_find)
#   high = length
#   low = 0
#   length.times do
#     guess = (low + high) / 2
#     return true if array[guess] == value_to_find
#     return false if high - low <= 1
#     array[guess] < value_to_find ? low = guess : high = guess
#   end
#   return false
# end
