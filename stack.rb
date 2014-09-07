class Stack
  def initialize
    @values = []
  end

  def push(value)
    @values << value
    value
  end

  def pop
    @values.delete_at(@values.length - 1)
  end

  def peek
    @values.last
  end
end
