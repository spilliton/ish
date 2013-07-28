require 'ish/version'
require 'ish/fixnum'


module Ish

  def self.default_precision
    @default_precision ||= 0.05
  end

  def self.default_precision=(val)
    @default_precision = val
  end

  def self.fuzzify(num, opts={})
    raise "argumanet must be a number!" if !num.respond_to?(:abs)

    offset = offset_from_opts(num, opts)

    # min offset for fixnum is 1
    offset = 1 if num.is_a?(Fixnum) && offset.abs < 1

    result = num + rand_offset(offset)

    # Fixnum in, fixnum out, aka FIFO
    if num.is_a? Fixnum
      result.to_i 
    else
      result
    end
  end

  private

  def self.offset_from_opts(num, opts={})
    precision = opts[:precision] || default_precision

    if max_off = opts[:max_offset]  
      raise ":max_offset must be a number!" if !max_off.respond_to?(:abs)
      max_off.abs
    else
      num.abs * precision  
    end
  end

  def self.rand_offset(offset)
    range = offset + 1 # because rand(1) only returns 0
    term = rand(range) 
    term *= -1 if rand(2) == 0 # minus half the time
    term
  end

end

