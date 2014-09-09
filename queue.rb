require File.expand_path(File.join(__dir__, 'singly_linked_list.rb'))

class Queue
  def initialize
    @linked_list = SinglyLinkedList.new
  end
  
  def enqueue(value)  
    @linked_list.append_tail value
    value
  end
  
  def dequeue
    @linked_list.shift
  end
  
  def front
    empty? ? nil : @linked_list.head.value
  end
  
  def empty?
    @linked_list.empty_list?
  end

  def size
    @linked_list.size
  end
end
