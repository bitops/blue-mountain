#
# Euclid's algorithm
# ISBN 978-0-07-352340-8
#
module Euclid
  #
  # Computes greatest common divisor between two integers.
  #
  # Returns nil if arguments are not integers.
  # Returns nil unless (a >= b && b >= 0) evaluates to true.
  #
  def self.gcd(a, b)
    return nil unless a.integer? && b.integer?
    return nil unless a >= b && b >= 0
    return a if b == 0
    
    gcd(b, a % b)
  end
end
