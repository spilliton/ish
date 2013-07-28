$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'rubygems'
require 'test/unit'
require 'ish'

INITIAL_DEFAULT_PRECISION = Ish.default_precision

class Test::Unit::TestCase

  def setup
    Ish.default_precision = INITIAL_DEFAULT_PRECISION
  end

  def assert_returns_all(arr)
    100.times do
      val = yield
      arr.delete(val)
    end

    if arr.length > 0
      assert false, "#{arr} values were never returned"
    else
      assert true
    end
  end

  def assert_always_between(low, high)
    100.times do 
      val = yield
      if val < low || val > high
        assert false, "#{val} was not between #{low} and #{high}"
      end
    end
    assert true
  end

end
