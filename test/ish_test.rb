$:.unshift '.'; require File.dirname(__FILE__) + '/test_helper'

class IshTest < Test::Unit::TestCase

  # def test_default_precission
  #   assert_equal 0.05, Ish.default_precision
  #   Ish.default_precision = 0.01
  #   assert_equal 0.01, Ish.default_precision
  # end

  # def test_fuzzify_fixnum
  #   assert_returns_all([19, 20, 21]) do
  #     Ish.fuzzify(20)
  #   end

  #   assert_always_between(19, 21) do 
  #     Ish.fuzzify(20)
  #   end

  #   assert_always_between(90, 110) do 
  #     Ish.fuzzify(100)
  #   end

  #   assert_returns_all([0, 1, 2]) do
  #     Ish.fuzzify(1)
  #   end

  #   assert_returns_all([-1, 0, 1]) do
  #     Ish.fuzzify(0)
  #   end

  #   assert_returns_all([-2, -1, 0]) do
  #     Ish.fuzzify(-1)
  #   end

  #   assert_returns_all([-21, -20, -19]) do
  #     Ish.fuzzify(-20)
  #   end
  # end

  # def test_fuzzify_fixnum_with_custom_offset
  #   assert_returns_all([-2, -1, 0, 1, 2]) do
  #     Ish.fuzzify(0, offset: 2)
  #   end

  #   assert_returns_all([47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57]) do
  #     Ish.fuzzify(52, offset: 5)
  #   end
  # end

  # def test_fuzzify_fixnum_with_custom_precision
  #   assert_returns_all([-98, -99, -100, -101, -102]) do 
  #     Ish.fuzzify(-100, precision: 0.02)
  #   end
  # end

  # def test_fuzzify_float
  #   assert_always_between(0.95, 1.05) do 
  #     Ish.fuzzify(1.0)
  #   end

  #   assert_always_between(-1.05, -0.95) do 
  #     Ish.fuzzify(-1.0)
  #   end    
  # end

  # def test_fuzzify_float_with_custom_offset
  #    assert_always_between(90, 110) do 
  #     Ish.fuzzify(100.0, offset: 10)
  #   end
  # end

  # def test_fuzzify_float_with_custom_precision
  #    assert_always_between(90, 110) do 
  #     Ish.fuzzify(100.0, offset: 0.10)
  #   end
  # end

  # def test_fixnum
  #   assert_returns_all([1, 2, 3]) do 
  #     2.ish
  #   end

  #   assert_returns_all([-112, -111, -110]) do 
  #     -111.ish(offset: 1)
  #   end

  #   assert_returns_all([2, 3, 4, 5, 6]) do 
  #     4.ish(precision: 0.5)
  #   end
  # end

  # def test_float
  #   assert_always_between(19, 21) do 
  #     20.0.ish
  #   end
  # end

  def test_time
    now = Time.now
    five_min_ago = now - 300
    five_min_from_now = now + 300

    assert_always_between(five_min_ago, five_min_from_now) do 
      now.ish
    end
  end

end
