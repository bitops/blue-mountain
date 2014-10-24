#
# Fibonacci implementation 
# ISBN 978-0-07-352340-8
#

class Fibonacci
  def initialize  
    @numbers = [0, 1]
  end

  def sequence(n)
    return 0 if n == 0

    # optimization not in the source text for speeding up multiple invocations
    return @numbers[n] unless @numbers[n].nil?

    (2..n).each do |i| 
      @numbers[i] = @numbers[i - 1] + @numbers[i - 2]
    end
    @numbers[n]
  end
end
