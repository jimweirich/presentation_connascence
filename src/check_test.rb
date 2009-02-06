require "test/unit"

def add_check_digit(digits)
  check_sum = digits.split(//).inject(0) { |r, n| r + n.to_i } % 10
  digits + ((10 - check_sum) % 10).to_s
end

def check?(digits)
  check_sum = digits.split(//).inject(0) { |r, n| r + n.to_i } % 10
  check_sum == 0  
end

class CheckTest < Test::Unit::TestCase
  def test_add_check_digit
    assert_equal "91", add_check_digit("9")
  end
  def test_add_check_digit_that_adds_to_10
    assert_equal "910", add_check_digit("91")
  end
  def test_check
    assert check?("91")
  end
  def test_example
    assert_equal "314159728", add_check_digit("31415972")
  end
end
