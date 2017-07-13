require "test_helper"

class CustomerTest < Minitest::Test

  def test_it_finds_a_customer
    c1 = MyEcommerce::Customer.new 'david@gmail.com'
    target = MyEcommerce::Customer.findCustomer 'david@gmail.com'
    assert_equal target, c1, 'No se encontro el usuario'
  end
  def test_it_doesnt_find_a_customer
    target = MyEcommerce::Customer.findCustomer 'alfredo@gmail.com'
    assert_nil target, 'No debiò haber encontrado el usuario'
  end
end
