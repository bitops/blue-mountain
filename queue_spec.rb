require File.expand_path(File.join(__dir__, 'queue'))

describe ::Queue do
  it "should behave like a queue" do
    s = ::Queue.new
    s.enqueue 42
    expect(s.front).to eq(42)
    s.enqueue 88
    expect(s.front).to eq(42)
    expect(s.size).to eq(2)
    expect(s.dequeue).to eq(42)
    expect(s.front).to eq(88)
    expect(s.dequeue).to eq(88)
    expect(s.empty?).to eq(true)
    expect(s.size).to eq(0)
    expect(s.front).to eq(nil)
  end
end
