require 'test_helper'

class LocalcallingguideTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::LocalCallingGuide::VERSION
  end

  def test_local_exchange_exists
    assert_respond_to LocalCallingGuide::LocalExchange, "prefixes", "LocalExchange class is not defined"
  end

  def test_local_prefix_exists
    assert_respond_to LocalCallingGuide::LocalPrefix, "prefixes", "LocalPrefix does not respond to prefixes"
  end

  def test_prefix_exists
    assert_respond_to LocalCallingGuide::Prefix, "npanxx", "Prefix does not respond to npanxx"
  end

  def test_rate_centre_exists
    assert_respond_to LocalCallingGuide::RateCentre, "rate_centre", "Prefix does not respond to rate_centre"
  end

  def test_distance_exists
    assert_respond_to LocalCallingGuide::Distance, "rc_dist", "Distance does not respond to rc_dist"
  end

  def test_local_exchange_prefix_returns_results
    assert LocalCallingGuide::LocalExchange.prefixes('015800').size > 0, "LocalExchange.prefixes is not returning any results"
  end

  def test_local_prefix_returns_results
    assert LocalCallingGuide::LocalPrefix.prefixes(250, 423).size > 0, "LocalPrefix.prefixes is not returning any results"
  end

  def test_prefix_returns_results
    assert LocalCallingGuide::Prefix.npanxx(250, 423).size > 0, "LocalPrefix.npanxx is not returning any results"
  end

  def test_rate_centre_returns_results
    assert LocalCallingGuide::RateCentre.rate_centre(npa:867).size > 0, "LocalPrefix.rate_centre is not returning any results"
  end

  def test_rate_centre_query_ottawa_on_returns_two_results
    assert LocalCallingGuide::RateCentre.rate_centre(rate_centre:"Ottawa",region:"ON").size == 2
  end

  def test_distance_returns_results
    assert LocalCallingGuide::Distance.rc_dist(416, 423, 905, 778).size > 0, "LocalPrefix.rc_dist is not returning any results"
  end

end
