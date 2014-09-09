require File.expand_path(File.join(__dir__, 'simple_node'))

class SinglyLinkedList
  attr_reader :head, :tail, :size
  
  def initialize
    @size = 0
  end
  
  def append_head(value)
    c = cell(value)
    if empty_list?
      @tail = c 
    end
    old_head = @head
    @head = c
    @head.next = old_head
    incr
    value
  end
  
  def append_tail(value)
    c = cell(value)
    if empty_list?
      @head = c 
    else
      @tail.next = c
    end
    @tail = c
    @tail.next = nil
    incr
    value
  end
  
  def shift
    return nil if empty_list?

    old_head_value = @head.value
    if single_element_list?
      @head = @tail = nil
    else
      @head = @head.next
    end
    decr
    old_head_value
  end
  
  def pop
    return nil if empty_list?
    return shift if single_element_list?
    
    each_node do |c|
      if c.next.next.nil?
        @tail = c
        @tail.next = nil
        break
      end
    end
  end
  
  def each
    each_node {|cell| yield(cell.value)}
  end
  
  def empty_list?
    @size.zero?
  end
  
  private
  def single_element_list?
    @size == 1
  end
  
  def incr  
    @size += 1
  end
  
  def decr
    @size -= 1
  end
  
  def cell(value)
    SimpleNode.new(value)
  end
  
  def each_node
    cell = @head
    while(true) do
      yield cell
      break if cell.next.nil?
      cell = cell.next
    end
  end
end
