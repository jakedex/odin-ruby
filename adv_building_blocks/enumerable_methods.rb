module Enumerable
  def my_each
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    for i in self
      yield(self[i], i)
    end
  end

  def my_select
    new_array = []
    self.my_each {|i| new_array << i if yield(i)}
    new_array
  end

  def my_all?
    my_each {|i| return false unless yield(i)}
    true
  end

  def my_none?
    my_each {|i| return false if yield(i)}
    true
  end

  def my_map(proc = nil)
    new_array = []
    if proc && block_given?
      my_each {|i| new_array << proc.call( yield(i) )}
    elsif proc && !block_given?
      my_each {|i| new_array << proc.call(i)}
    elsif !proc && block_given?
      my_each {|i| new_array << yield(i)}
    else
      self
    end

    new_array
  end

  def my_inject(initial = nil)
    memo = initial.nil? ? self[0] : initial
    my_each {|i| memo = yield(memo, i)}
    memo
  end
end

def multiply_els array
  array.my_inject {|product, item| item*product}
end
