module Linked

  class Node
    attr_accessor :value, :next

    def initialize(value)
      @value = value
      @next = nil
    end
  end

  # TODO: refactor so that head is most recently inserted element

  class List
    attr_reader :head, :tail, :size

    def initialize
      @size = 0
    end

    def <<(value)
      c = cell(value)
      if first_insertion?
        @head = c
      else
        @tail.next = c
      end
      @tail = c
      @size += 1
      value
    end

    def [](i)
      nth(i).value
    end

    def []=(i, val)
      nth(i).value = val
    end

    def each
      each_cell {|cell| yield(cell.value)}
    end

    def map
      list = Linked::List.new
      self.each {|value| list << yield(value)}
      list
    end

    def first
      @head.value
    end
    
    def last
      @tail.value
    end

    private
    def first_insertion?
      @size.zero?
    end

    def cell(value)
      Linked::Node.new(value)
    end

    def each_cell
      count = 0
      cell = @head
      while(count < @size) do
        yield cell
        cell = cell.next
        count += 1
      end
    end

    def nth(n)
      raise "OutOfBounds" if n > @size

      count = 0
      curr = @head
      while(count != n) do
        curr = curr.next
        count += 1
      end
      curr
    end
  end

end
