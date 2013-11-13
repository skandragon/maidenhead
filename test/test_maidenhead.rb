require 'helper'

class TestMaidenhead < Minitest::Test
  def test_convert_from_maidenhead_5
    lat, lon = Maidenhead.to_latlon('IO93lo72hn')
    assert_equal 53.593924, lat
    assert_equal -1.022569, lon
  end

  def test_convert_from_maidenhead_4
    lat, lon = Maidenhead.to_latlon('IO93lo72')
    assert_equal 53.593576, lat
    assert_equal -1.021181, lon
  end

  def test_convert_from_maidenhead_3
    lat, lon = Maidenhead.to_latlon('IO93lo')
    assert_equal 53.606076, lat
    assert_equal -1.037847, lon
  end

  def test_convert_from_maidenhead_2
    lat, lon = Maidenhead.to_latlon('IO93')
    assert_equal 53.481076, lat
    assert_equal -1.037847, lon
  end

  def test_convert_from_maidenhead_1
    lat, lon = Maidenhead.to_latlon('IO')
    assert_equal 55.481076, lat
    assert_equal -9.037847, lon
  end

  def test_convert_to_maidenhead_5
    maidenhead = Maidenhead.to_maidenhead(53.593923, -1.022569, 5)
    assert_equal 'IO93lo72hn', maidenhead
  end

  def test_convert_to_maidenhead_4
    maidenhead = Maidenhead.to_maidenhead(53.593923, -1.022569, 4)
    assert_equal 'IO93lo72', maidenhead
  end

  def test_convert_to_maidenhead_3
    maidenhead = Maidenhead.to_maidenhead(53.593923, -1.022569, 3)
    assert_equal 'IO93lo', maidenhead
  end

  def test_convert_to_maidenhead_2
    maidenhead = Maidenhead.to_maidenhead(53.593923, -1.022569, 2)
    assert_equal 'IO93', maidenhead
  end

  def test_convert_to_maidenhead_1
    maidenhead = Maidenhead.to_maidenhead(53.593923, -1.022569, 1)
    assert_equal 'IO', maidenhead
  end
end
