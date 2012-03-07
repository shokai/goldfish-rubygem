require File.dirname(__FILE__) + '/test_helper.rb'

class TestGoldfishPoi < Test::Unit::TestCase

  def setup
    @tag = "test_#{Time.now.to_i}_#{Time.now.usec}"
    @data = "data_#{Time.now.to_i}_#{Time.now.usec}"
    @poi = GoldFish::Poi.new('http://ubif.org:8932')
  end

  def test_post_get
    @poi.post(@tag, @data)
    @res = @poi.get(@tag)
    assert true if @res == @data
  end

  def test_commet
    Thread.new do
      @res = @poi.get(@tag)
    end
    sleep 3
    @poi.post(@tag, @data)
    assert true if @res == @data
  end

end
