require File.expand_path(File.join(__dir__, 'singly_linked_list.rb'))

class Stack
  def initialize
    @linked_list = SinglyLinkedList.new
  end
  
  def push(value)  
    @linked_list.append_head value
  end
  
  def pop
    @linked_list.shift
  end
  
  def peek
    empty? ? nil : @linked_list.head.value
  end
  
  def empty?
    @linked_list.size == 0
  end
end
