$:.unshift '.'; require File.dirname(__FILE__) + '/test_helper'

class IshTest < Test::Unit::TestCase

  def test_default_precission
    assert_equal 0.05, Ish.default_precision
    Ish.default_precision = 0.01
    assert_equal 0.01, Ish.default_precision
  end

  def test_fuzzify_fixnum
    # assert_equal Fixnum, Ish.fuzzify(19).class, 'should always return fixum if passed a fixnum'

    assert_returns_all([19, 20, 21]) do
      Ish.fuzzify(20)
    end

    assert_always_between(19, 21) do 
      Ish.fuzzify(20)
    end

    assert_always_between(90, 110) do 
      Ish.fuzzify(100)
    end
  end

end
