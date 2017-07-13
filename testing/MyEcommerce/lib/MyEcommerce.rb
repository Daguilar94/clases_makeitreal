require "MyEcommerce/version"

module MyEcommerce

  class InvalidCouponError < StandardError
  end

  class Customer
    @@customers = []

    attr_accessor :email
    def initialize(email)
      @email = email
      @orders = []
      @@customers.push self
    end

    def self.findCustomer email
      @@customers.find do |customer|
        customer.email == email
      end
    end
  end

  class Order
    attr_accessor :customer
    def initialize(shipping)
      @productos = []
      @shipping = shipping
    end

    def agregarProductos prods
      prods.each do |producto|
        @productos.push producto
      end
    end

    def total(cupon = nil)
      total = 0
      if @shipping == 'US'
        shippingValue = 0
      elsif (@shipping == 'MEX' || @shipping == 'CA')
        shippingValue = 15
      else
        shippingValue = 25
      end
      if !@productos.empty?
        @productos.each do |product|
          cant = product.cantidad
          precio = product.precio
          total += cant*precio
        end
        if cupon != nil
          if cupon[:code][0] != 'C'
            raise MyEcommerce::InvalidCouponError.new("El codigo del cupon no empieza por C")
          end
          if cupon[:discount] < 0
            raise MyEcommerce::InvalidCouponError.new("El descuento tiene un valor negativo")
          end
          total -= total*(cupon[:discount]/100.0)
        end
      end
      total += shippingValue
    end

  end

  class Producto
    attr_accessor :cantidad, :precio
    def initialize(nombre, cantidad, precio)
      @nombre = nombre
      @cantidad = cantidad
      @precio = precio
    end
  end

end
