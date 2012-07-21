require File.expand_path(File.join(File.dirname(__FILE__), "linked_list"))

def test_with(n)
  l = Linked::List.new
  (1..n).each {|i| l << i}
  l.each {|i| i * 1}
end

[1, 10, 100, 1000, 10000, 100000, 1000000].each do |i|
  puts "Testing with #{i}..."
  sleep 1
  puts "Go!"
  before = Time.now.to_i
  test_with i
  after = Time.now.to_i
  delta = after - before
  puts "Done! Took #{delta}."
end
