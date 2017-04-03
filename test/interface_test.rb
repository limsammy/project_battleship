require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/interface'

class InterfaceTest < Minitest::Test
  def test_instatiates_new_object
    messages = Interface.new

    assert_instance_of Interface, messages
  end
end