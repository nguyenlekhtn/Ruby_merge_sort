def merge_rec(left_arr, right_arr, result = [])
  return result if left_arr.empty? && right_arr.empty?
  if right_arr.empty?
    result += left_arr
    return result
  elsif left_arr.empty?
    result += right_arr
    return result
  else
    is_first_left_smaller_than_right = left_arr[0] < right_arr[0]
    result << (is_first_left_smaller_than_right ? left_arr[0] : right_arr[0])
    new_left_arr, new_right_arr = is_first_left_smaller_than_right ? [left_arr[1..], right_arr]: [left_arr, right_arr[1..]]
    merge(new_left_arr, new_right_arr, result)
  end
end

def merge(left_arr, right_arr)
  left_arr_cursor = 0
  right_arr_cursor = 0
  merged = []
  while left_arr_cursor < left_arr.length || right_arr_cursor < right_arr.length
    if left_arr[left_arr_cursor].nil?
      merged += right_arr[right_arr_cursor..]
      break
    elsif right_arr[right_arr_cursor].nil?
      merged += left_arr[left_arr_cursor..]
      break
    elsif left_arr[left_arr_cursor] < right_arr[right_arr_cursor]
      merged << left_arr[left_arr_cursor]
      left_arr_cursor += 1
    else
      merged << right_arr[right_arr_cursor]
      right_arr_cursor += 1
    end
  end
  merged


end

def merge_sort(arr)

  return arr if arr.length == 1

  sorted_left = merge_sort(arr[0..arr.length / 2 - 1])
  sorted_right = merge_sort(arr[arr.length / 2..])
  merge(sorted_left, sorted_right)
end

arr = [9, 8, 5 , 1, 13, 2, 4, 7, 3, 9, 0, 5]
p merge_sort(arr)

