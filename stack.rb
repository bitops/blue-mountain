class Stack
  def initialize
    @values = []
  end

  def push(value)
    @values << value
    value
  end

  def pop
    unless @values.empty?
      @values.delete_at(@values.length - 1)
    else
      nil
    end
  end

  def peek
    @values.last
  end

  def empty?  
    @values.empty?
  end
end
