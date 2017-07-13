require "test_helper"

class OrderTest < Minitest::Test
  def test_it_returns_the_toal_of_an_empty_order
    o1 = MyEcommerce::Order.new 'US'
    total = o1.total
    assert_equal total, 0, 'No calculo un total de cero para una orden vacía'
  end

  def test_it_returns_the_total_of_one_product_of_the_order
    p1 = MyEcommerce::Producto.new('Audifonos', 2, 3000)
    o1 = MyEcommerce::Order.new 'US'
    o1.agregarProductos([p1])
    total = o1.total
    assert_equal total, 6000, 'No calculo el total correcto para un producto'
  end

  def test_it_returns_the_total_of_several_products_of_the_order
    p1 = MyEcommerce::Producto.new('Celular', 1, 1000)
    p2 = MyEcommerce::Producto.new('Audifonos', 2, 3000)
    p3 = MyEcommerce::Producto.new('shoes', 1,2000)
    o1 = MyEcommerce::Order.new 'US'
    o1.agregarProductos([p1, p2, p3])
    total = o1.total
    assert_equal total, 9000, 'No se calculo el total'
  end

  def test_it_returns_the_invalid_coupon_when_code_doesnt_start_with_C
    p1 = MyEcommerce::Producto.new('Celular', 1, 1000)
    p2 = MyEcommerce::Producto.new('Audifonos', 2, 3000)
    o1 = MyEcommerce::Order.new 'US'
    o1.agregarProductos([p1, p2])
    assert_raises(MyEcommerce::InvalidCouponError){
      o1.total({code: 'Ds34', discount: 20})
    }
  end

  def test_it_returns_the_invalid_coupon_when_discount_is_negative
    p1 = MyEcommerce::Producto.new('Celular', 1, 1000)
    p2 = MyEcommerce::Producto.new('Audifonos', 2, 3000)
    o1 = MyEcommerce::Order.new 'US'
    o1.agregarProductos([p1, p2])
    assert_raises(MyEcommerce::InvalidCouponError){
      o1.total({code: 'Cs34', discount: -20})
    }
  end

  def test_it_returns_the_total_with_the_coupon_discount_of_50
    p1 = MyEcommerce::Producto.new('Celular', 1, 1000)
    p2 = MyEcommerce::Producto.new('Audifonos', 2, 3000)
    p3 = MyEcommerce::Producto.new('shoes', 1,2000)
    o1 = MyEcommerce::Order.new 'US'
    o1.agregarProductos([p1, p2, p3])
    total = o1.total({code: 'Cs34', discount: 50})
    assert_equal total, 4500, 'No calculo el valor correcto de un descuento del 50%'
  end

  def test_it_returns_0_as_the_total_of_an_empty_order_with_coupon
    o1 = MyEcommerce::Order.new 'US'
    total = o1.total({code: 'Cs34', discount: 50})
    assert_equal total, 0, 'No calculo el valor correcto de una o den vacia con descuento del 50%'
  end

  def test_it_returns_the_total_plus_the_shipping_and_coupon
    p1 = MyEcommerce::Producto.new('Celular', 1, 1000)
    p2 = MyEcommerce::Producto.new('Audifonos', 2, 3000)
    o1 = MyEcommerce::Order.new 'COL'
    o1.agregarProductos([p1, p2])
    total = o1.total({code: 'Cs34', discount: 30})
    assert_equal total, 4925, 'No entrego el total adecuado con el decuento del cupon y el precio del shipping'
  end

  def test_it_returns_the_total_plus_the_shipping_and_no_coupon
    p1 = MyEcommerce::Producto.new('Celular', 1, 1000)
    p2 = MyEcommerce::Producto.new('Audifonos', 2, 3000)
    o1 = MyEcommerce::Order.new 'CA'
    o1.agregarProductos([p1, p2])
    total = o1.total
    assert_equal total, 7015, 'No entrego el total adecuado de la orden mas el precio del shipping'
  end

  def test_it_returns_the_total_of_an_empty_order_plus_the_shipping_and_coupon
    o1 = MyEcommerce::Order.new 'MEX'
    total = o1.total({code: 'Cs34', discount: 30})
    assert_equal total, 15, 'No entrego el total de una orden vacia pero con shipping'
  end

  def test_it_returns_the_total_of_an_order_plus_the_shipping_and_no_coupon
    p1 = MyEcommerce::Producto.new('Celular', 1, 1000)
    p2 = MyEcommerce::Producto.new('Audifonos', 2, 3000)
    o1 = MyEcommerce::Order.new 'US'
    o1.agregarProductos([p1, p2])
    total = o1.total
    assert_equal total, 7000, 'No entrego el total de una orden sin cupon pero con shipping'
  end

end
