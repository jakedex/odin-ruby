def bubble_sort array
  sorted = false

  while !sorted
    sorted = true
    (array.length - 1).times do |index|
      if array[index] > array[index+1]
        array[index], array[index + 1] = array[index + 1], array[index] #swap
        sorted = false
      end
    end
  end

  array
end

def bubble_sort_by(array)
  sorted = false

  while !sorted
    sorted = true
    (array.length - 1).times do |index|
      if yield(array[index], array[index+1]) > 0
        array[index], array[index + 1] = array[index + 1], array[index] #swap
        sorted = false
      end
    end
  end

  array
end


if $PROGRAM_NAME == __FILE__
  p bubble_sort([4,3,78,2,0,2])
  arr = bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length - right.length
  end

  p arr
end
