require File.expand_path(File.join(__dir__, 'stack'))

describe Stack do
  it "should behave like a stack" do
    s = Stack.new
    s.push 42
    expect(s.peek).to eq(42)
    s.push 88
    expect(s.pop).to eq(88)
    expect(s.peek).to eq(42)
    expect(s.pop).to eq(42)
    expect(s.empty?).to eq(true)
    expect(s.peek).to eq(nil)
    expect(s.pop).to eq(nil)
  end
end
