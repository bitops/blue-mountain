require 'benchmark'
require File.expand_path(File.join(__dir__, 'stack'))
require File.expand_path(File.join(__dir__, 'queue'))

puts "**********************************************"
puts "*************  BENCHMARKS  *******************"
[1000, 10000, 100000, 1000000, 10000000].each do |n|
  puts "**********************************************"
  puts "Stack of #{n}:"
  Benchmark.bm do |x|
    x.report {      
      s = Stack.new
      n.times {|i| s.push(i)}
      n.times {|i| s.pop }
    }
  end
  puts
  puts "Queue of #{n}:"
   Benchmark.bm do |x|
    x.report {
      q = Queue.new
      n.times {|i| q.enqueue(i)}
      n.times {|i| q.dequeue }
    }
  end
end

