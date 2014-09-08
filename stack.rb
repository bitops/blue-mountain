require File.expand_path(File.join(__dir__, 'singly_linked_list.rb'))

class Stack

  def initialize
    @linked_list = SinglyLinkedList.new
  end
  
  def push(value)  
    @linked_list << value
    value
  end
  
  def pop
    unless empty?
      @linked_list.shift
    else
      nil
    end
  end
  
  def peek
    empty? ? nil : @linked_list.head.value
  end
  
  def empty?
    @linked_list.size == 0
  end
end
