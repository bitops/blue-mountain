module Linky

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
      raise "OutOfBounds" if n > @size
      nth(n).value
    end

    def []=(n, val)
      raise "OutOfBounds" if n > @size
      nth(n).value = val
    end

    def each
      iter(@head) {|cell| yield cell}
    end

    def map
      list = Linky::List.new
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
      Linky::Cell.new(value)
    end

    def iter(cell, &block)
      yield cell.value
      if cell.next
        iter(cell.next, &block) 
      end
    end

    def nth(n)
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
