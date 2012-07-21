require File.expand_path(File.join(File.dirname(__FILE__), "linked_list"))

def test_with(n)
  l = Linked::List.new
  (1..n).each {|i| l << i}
  # l.each {|i| puts i}
end

[1, 10, 100, 1000, 10000, 100000].each do |i|
  puts "Testing with #{i}..."
  sleep 3
  test_with i
end
