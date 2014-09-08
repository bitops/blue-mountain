module Linked

  class Node
    attr_accessor :value, :next

    def initialize(value)
      @value = value
      @next = nil
    end
  end

  class List
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
      new_head = @head.next
      old_head = @head.value
      @head = new_head
      old_head
    end

    def each
      each_cell {|cell| yield(cell.value)}
    end

    private
    def first_insertion?
      @size.zero?
    end

    def cell(value)
      Linked::Node.new(value)
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
end
