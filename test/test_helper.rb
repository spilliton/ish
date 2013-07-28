$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'rubygems'
require 'test/unit'
require 'ish'

INITIAL_DEFAULT_PRECISION = Ish.default_precision
SAMPLE_RATE = 200

class Test::Unit::TestCase

  def setup
    Ish.default_precision = INITIAL_DEFAULT_PRECISION
  end

  def assert_returns_all(arr)
    seen = arr.clone
    unexpected = []
    SAMPLE_RATE.times do
      val = yield
      if arr.include? val
        seen.delete(val)
      else
        unexpected << val
      end
    end

    unexpected.uniq!

    if seen.length > 0
      assert false, "#{arr} values were never returned"
    elsif unexpected.length > 0
      assert false, "#{unexpected} values were returned unexpectedly"
    else
      assert true
    end
  end

  def assert_always_between(low, high)
    SAMPLE_RATE.times do 
      val = yield
      if val < low || val > high
        assert false, "#{val} was not between #{low} and #{high}"
      end
    end
    assert true
  end

end
