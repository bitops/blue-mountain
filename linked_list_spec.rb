require File.expand_path(File.join(__dir__, 'linked_list'))

describe Linked::List do
  context "#head" do
    it "should be the most recently inserted element" do
      ll = Linked::List.new
      ll << 42
      ll << 88
      expect(ll.head.value).to eq(88)
    end

    it "should be possible to remove the head" do
      ll = Linked::List.new
      ll << 42
      ll << 88
      expect(ll.head.value).to eq(88)
      popped = ll.shift
      expect(popped).to eq(88)
      expect(ll.head.value).to eq(42)
    end
  end

  context "#next" do
    it "should point to the previously inserted element" do
      ll = Linked::List.new
      ll << 42
      ll << 88
      expect(ll.head.next.value).to eq(42)
    end
  end

  context "#tail" do
    it "should be the first element inserted" do
      ll = Linked::List.new
      ll << 42
      ll << 88
      expect(ll.tail.value).to eq(42)
    end

    it "should have a next of nil to indicate list termination" do
      ll = Linked::List.new
      ll << 42
      ll << 88
      expect(ll.tail.next).to eq(nil)
    end
  end

  context "#each" do
    it "should iterate over each cell" do
      ll = Linked::List.new
      [42, 88, 108].each {|v| ll << v}      

      results = []
      ll.each {|cell_value| results << (cell_value * 2) }

      [84, 176, 216].each {|v| expect(results.include?(v)).to eq(true) }
    end
  end
end
