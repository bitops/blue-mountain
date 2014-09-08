require File.expand_path(File.join(__dir__, 'simple_node'))

class SinglyLinkedList
  attr_reader :head, :tail, :size
  
  def initialize
    @size = 0
  end
  
  def <<(value)
    c = cell(value)
    if first_insertion?
      @tail = c 
    end
    old_head = @head
    @head = c
    @head.next = old_head
    @size += 1
    value
  end
  
  def shift
    old_head_value = @head.value
    @head = @head.next
    @size -= 1
    old_head_value
  end
  
  def each
    each_cell {|cell| yield(cell.value)}
  end
  
  private
  def first_insertion?
    @size.zero?
  end
  
  def cell(value)
    SimpleNode.new(value)
  end
  
  def each_cell
    cell = @head
    while(true) do
      yield cell
      break if cell.next.nil?
      cell = cell.next
    end
  end
end
