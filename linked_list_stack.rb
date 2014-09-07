require File.expand_path(File.join(__dir__, 'linked_list.rb'))

class LinkedListStack
  def initialize
    @values= Linked::List.new
  end
  
  def push(value)  
    
  end
  
  def pop
    
  end
  
  def peek
    @values.tail.value
  end
  
  def empty?
    
  end
end
