require 'ish/version'
require 'ish/fixnum'


module Ish

  def self.default_precision
    @default_precision ||= 0.05
  end

  def self.default_precision=(val)
    @default_precision = val
  end

  def self.fuzzify(num)
    plus_minus = num * default_precision

    if num.is_a? Fixnum
      plus_minus = plus_minus.to_i
    end

    term = rand(plus_minus + 1) 
    term = term * -1 if rand(2) == 1 # sometimes minus

    num + term
  end

end


# # Mix it in
# class Fixnum
#   include Ish::Fixnum
# end
