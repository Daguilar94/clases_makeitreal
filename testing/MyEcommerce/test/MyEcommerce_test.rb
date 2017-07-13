require "test_helper"

class MyEcommerceTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::MyEcommerce::VERSION
  end
end
