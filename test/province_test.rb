gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test

  def setup
    @asia = Province.new(sample_province_data)
  end

  def test_province_shortfall
    assert_equal(5, @asia.shortfall)
  end

  def test_province_profit
    assert_equal(230, @asia.profit)
  end

  def test_change_production
    @asia.producers[0].production = 20;
    assert_equal(-6, @asia.shortfall)
    assert_equal(292, @asia.profit)
  end

  def test_null_producers
    data = {
      name: 'No producers',
      producers: [],
      demand: 30,
      price: 20
    }
    nullProducers = Province.new(data)
    assert_equal(30, nullProducers.shortfall)
    assert_equal(0, nullProducers.profit)
  end

  def test_zero_demand
    @asia.demand = 0
    assert_equal(-25, @asia.shortfall)
    assert_equal(0, @asia.profit)
  end

  def test_negative_demand
    @asia.demand = -1
    assert_equal(-26, @asia.shortfall)
    assert_equal(-10, @asia.profit)
  end

  # def test_empty_string_demand
  #   @asia.demand = -1
  #   assert_equal(-26, @asia.shortfall)
  #   assert_equal(-10, @asia.profit)
  # end

  # def test_string_producers
  #   data = {
  #     name: 'String producers',
  #     producers: "",
  #     demand: 30,
  #     price: 20
  #   }
  #   producers = Province.new(data)
  #   assert_equal(0, nullProducers.shortfall)
  # end

end

