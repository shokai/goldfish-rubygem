require File.dirname(__FILE__) + '/test_helper.rb'

class TestGoldfishPoi < Test::Unit::TestCase

  def setup
    @a = :asdf
  end
  
  def test_truth
    puts @a
    assert true
  end
end
