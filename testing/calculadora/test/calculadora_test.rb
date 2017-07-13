require "test_helper"

class CalculadoraTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Calculadora::VERSION
  end

  def test_it_sums_two_positive_numbers
    suma = Calculadora.sum 2, 4
    assert_equal suma, 6, 'sum should be 6'
  end
  def test_it_multiplies_two_positive_numbers
    multiply = Calculadora.times 5, 6
    assert_equal multiply, 30, 'Multiplication should be 30'
  end
  def test_it_multiplies_one_positive_and_one_negative_number
    multiply = Calculadora.times 4, -5
    assert_equal multiply, -20, 'multiplication should be -20'
  end
  def test_it_drpos_an_error_if_divided_by_zero
    assert_raises ZeroDivisionError do
      Calculadora.div 2, 0
    end
  end
  def test_it_should_compute_math

  end
  #Implemente los tests de una sumatoria, donde dado un arreglo de npumeros o strings que contengan
  #numeros, me retorna la suma de todos ellos.
  #Casos:
  #[0] => 0
  #[1, 2, 3, 4] => 10
  #[-1, -2, -3, -4] => -10
  #[1, -2, 3, -4] => -2
  #["1", 2, "4", "-5"] => 2

  def test_it_sums_empty_array
   sumArray = Calculadora.sumArray []
   assert_equal sumArray, 0, 'sumArray should be 10'
  end
  def test_it_sums_positive_numbers_in_array
    sumArray = Calculadora.sumArray [1, 2, 3, 4]
    assert_equal sumArray, 10, 'sumArray should be 10'
  end
  def test_it_sums_negative_numbers_in_array
    sumArray = Calculadora.sumArray [-1, -2, -3, -4]
    assert_equal sumArray, -10, 'sumArray should be -10'
  end
  def test_it_sums_positive_and_negative_numbers_in_array
    sumArray = Calculadora.sumArray [1, -2, 3, -4]
    assert_equal sumArray, -2, 'sumArray should be -2'
  end
  def test_it_sums_numbers_and_string_numbers_in_array
    sumArray = Calculadora.sumArray ["1", 2, "4", "-5"]
    assert_equal sumArray, 2, 'sumArray should be 2'
  end
end
