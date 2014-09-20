require File.expand_path(File.join(__dir__, 'singly_linked_list'))

describe SinglyLinkedList do
  context "#head" do
    it "should be the first item in the list" do
      ll = SinglyLinkedList.new
      ll.append_head 42
      ll.append_head 88
      expect(ll.head.value).to eq(88)
    end

    it "should be possible to remove the head" do
      ll = SinglyLinkedList.new
      ll.append_head 42
      ll.append_head 88
      expect(ll.size).to eq(2)
      expect(ll.head.value).to eq(88)
      popped = ll.shift
      expect(ll.size).to eq(1)
      expect(popped).to eq(88)
      expect(ll.head.value).to eq(42)
    end
  end

  context "#shift and #pop" do
    it "shift with single element list" do
      ll = SinglyLinkedList.new
      ll.append_head 42
      expect(ll.head.value).to eq(42)
      ll.shift
      expect(ll.empty_list?).to eq(true)
    end

    it "pop with single element list" do
      ll = SinglyLinkedList.new
      ll.append_head 42
      expect(ll.head.value).to eq(42)
      expect(ll.tail.value).to eq(42)
      ll.pop
      expect(ll.empty_list?).to eq(true)
    end

    it "pop with multi element list" do
      ll = SinglyLinkedList.new
      ll.append_head 42
      ll.append_head 88
      expect(ll.head.value).to eq(88)
      expect(ll.tail.value).to eq(42)
      expect(ll.pop).to eq(42)
    end

    it "shift with empty list" do
      ll = SinglyLinkedList.new
      expect(ll.empty_list?).to eq(true)
      ll.shift
      expect(ll.empty_list?).to eq(true)
    end

    it "pop with empty list" do
      ll = SinglyLinkedList.new
      expect(ll.empty_list?).to eq(true)
      ll.pop
      expect(ll.empty_list?).to eq(true)
    end

    it "should return nil for head and tail for empty list" do
      ll = SinglyLinkedList.new
      expect(ll.empty_list?).to eq(true)
      expect(ll.head).to eq(nil)
      expect(ll.tail).to eq(nil)
    end
  end

  context "#next" do
    it "should point to the previously inserted element" do
      ll = SinglyLinkedList.new
      ll.append_head 42
      ll.append_head 88
      expect(ll.head.next.value).to eq(42)
    end
  end

  context "#tail" do
    it "should be the last element in the list" do
      ll = SinglyLinkedList.new
      ll.append_head 42
      ll.append_head 88
      expect(ll.tail.value).to eq(42)
    end

    it "should have a next of nil to indicate list termination" do
      ll = SinglyLinkedList.new
      ll.append_head 42
      ll.append_head 88
      expect(ll.tail.next).to eq(nil)
    end

    it "should allow appending to it" do
      ll = SinglyLinkedList.new
      ll.append_tail 42
      ll.append_tail 88
      expect(ll.tail.value).to eq(88)
    end

    it "should be possible to remove the tail" do
      ll = SinglyLinkedList.new
      ll.append_tail 42
      ll.append_tail 88
      ll.append_tail 108
      expect(ll.tail.value).to eq(108)
      ll.pop
      expect(ll.tail.value).to eq(88)
      ll.pop
      expect(ll.tail.value).to eq(42)
    end
  end

  context "#each" do
    it "should iterate over each cell" do
      ll = SinglyLinkedList.new
      [42, 88, 108].each {|v| ll.append_head v}      

      results = []
      ll.each {|cell_value| results << (cell_value * 2) }

      [84, 176, 216].each {|v| expect(results.include?(v)).to eq(true) }
    end
  end
end
