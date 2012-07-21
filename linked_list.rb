module Linked

  class Cell
    attr_accessor :value, :next

    def initialize(value)
      @value = value
      @next = nil
    end
  end

  class List
    attr_reader :head, :tail, :size

    def initialize
      @head = nil
      @tail = @head
      @size = 0
    end

    def <<(value)
      n = node(value)
      if @size.zero?
        @head = n
        @tail = @head
      else
        @tail.next = n
        @tail = n
      end
      @size += 1
      value
    end

    def [](n)
      nth(n).value
    end

    def []=(n, val)
      nth(n).value = val
    end

    def each
      count = 0
      cell = @head
      while(count < @size) do
        yield cell.value
        cell = cell.next
        count += 1
      end
    end

    def map
      list = Linked::List.new
      self.each {|cell| list << yield(cell)}
      list
    end

    def first
      @head.value
    end
    
    def last
      @tail.value
    end

    private
    def node(value)
      Linked::Cell.new(value)
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
