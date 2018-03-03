require "test_helper"

class BetterDigTest < Minitest::Test
  def setup
    @hash  = { hello: 'world', nested: { hello: 'nested world' }, nested_array: ['hello', 'world'] }
    @array = ['hello', 'world', { something: { nested: 'nested string' } }]
  end

  def test_that_it_has_a_version_number
    refute_nil ::BetterDig::VERSION
  end

  def test_that_it_can_dig_from_hash
    assert_equal 'world', @hash.digg(:hello)
    assert_equal 'nested world', @hash.digg(:nested, :hello)
  end

  def test_that_it_can_dig_from_array
    assert_equal 'hello', @array.digg(0)
    assert_equal 'nested string', @array.digg(2, :something, :nested)
  end

  def test_that_it_can_dig_indifferently
    assert_equal 'world', @hash.digg('hello')
    assert_equal 'nested world', @hash.digg('nested', 'hello')
    assert_equal 'hello', @hash.digg('nested_array', '0')
  end

  def test_that_it_returns_nil_when_not_found
    assert_nil @hash.digg('hello', :not_found)
    assert_nil @hash.digg('0')
    assert_nil @array.digg(2, :something, :nested, 5)
    assert_nil @array.digg('h')
  end
end
