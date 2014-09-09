require 'benchmark'
require File.expand_path(File.join(__dir__, 'stack'))
require File.expand_path(File.join(__dir__, 'queue'))

puts "**********************************************"
puts "*************  BENCHMARKS  *******************"
[1000, 10000, 100000, 1000000, 10000000].each do |n|
  puts "**********************************************"
  puts "Stack of #{n}:"
  s = Stack.new
  puts "Push:"
  Benchmark.bm do |x|    
    x.report {      
      n.times {|i| s.push(i)}
    }
  end
  puts "Pop:"
  Benchmark.bm do |x|
    
    x.report {      
      n.times {|i| s.pop }
    }
  end
  puts
  puts "Queue of #{n}:"
  q = Queue.new
   puts "Enqueue:"
   Benchmark.bm do |x|
    x.report {
      n.times {|i| q.enqueue(i)}
    }
  end
  puts "Dequeue:"
   Benchmark.bm do |x|
    x.report {
      n.times {|i| q.dequeue }
    }
  end
end

