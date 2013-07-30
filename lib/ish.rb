require 'ish/version'
require 'ish/number'
require 'ish/time'


module Ish

  def self.default_precision
    @default_precision ||= 0.05
  end

  def self.default_precision=(val)
    @default_precision = val
  end

  # 5 min = 300 sec
  def self.default_time_offset_seconds
    @default_time_offset_seconds ||= 300 
  end

  def self.default_time_offset_seconds=(val)
    @default_time_offset_seconds = val
  end

  def self.fuzzify(num, opts={})
    raise "argument must be a number!" if !num.respond_to?(:abs)

    offset = offset_from_opts(num, opts)

    # min offset for fixnum is 1
    offset = 1 if num.is_a?(Fixnum) && offset.abs < 1

    rand_offset = if num.is_a? Fixnum
      rand_integer_offset(offset)
    else
      rand_float_offset(offset)
    end

    result = num + rand_offset

    # Fixnum in, fixnum out, aka FIFO
    if num.is_a? Fixnum
      result.to_i 
    else
      result
    end
  end

  def self.fuzzify_time(time, opts={})
    raise 'argument must be a time!' if !time.is_a? Time
    offset = time_offset_from_opts(opts)
    rand_offset = rand_integer_offset(offset)
    time + rand_offset
  end

  def self.rand_integer_offset(offset)
    range = offset + 1 # because rand(1) only returns 0
    term = rand(range) 
    term *= -1 if rand(2) == 0 # minus half the time
    term
  end

  def self.rand_float_offset(offset)
    term = offset * rand # rand is between 0.0 and 1.0
    term *= -1 if rand(2) == 0 # minus half the time
    term
  end

  private

  def self.offset_from_opts(num, opts={})
    precision = opts[:precision] || default_precision

    if offset = opts[:offset]  
      raise ":offset must be a number!" if !offset.respond_to?(:abs)
      offset.abs
    else
      num.abs * precision  
    end
  end

  def self.time_offset_from_opts(opts={})
    offset = opts[:offset] || default_time_offset_seconds
  end

end

class Fixnum
  include Ish::Number
end

class Float
  include Ish::Number
end

class Time
  include Ish::Time
end

class DateTime
  include Ish::Time
end

