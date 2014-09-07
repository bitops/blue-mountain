require File.expand_path(File.join(__dir__, 'linked_list.rb'))

class LinkedListStack

  # http://en.wikipedia.org/wiki/Linked_list#Singly_linked_lists

  def initialize
    @values= Linked::List.new
  end
  
  def push(value)  
    @values << value
    value
  end
  
  def pop
    unless empty?

    else
      nil
    end
  end
  
  def peek
    empty? ? nil : @values.tail.value
  end
  
  def empty?
    @values.size == 0
  end
end
