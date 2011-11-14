class Array
  
  def sum 
    inject(0) { |sum,x| sum + x }
  end

  def mean 
    sum.to_f / size.to_f
  end

  def merge(bits)
    inject_with_index(0) { |result, x, index| result + (x << (bits * index)) }
  end

  private
  
  def inject_with_index(injected)
    each_with_index{ |obj, index| injected = yield(injected, obj, index) }
    injected
  end  
end
