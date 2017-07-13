require "calculadora/version"

module Calculadora
  def self.sum num1, num2
    num1 + num2
  end
  def self.times num1, num2
    num1 * num2
  end
  def self.div num1, num2
    num1/num2
  end
  def self.math num1, num2, num3
    sum times(num1, num2), num3
  end
  def self.sumArray arr
    #solucion simon = arr.map(&:to_i).reduce(:+) || 0
   sum = 0
   if !arr.empty?
    arr.each do |element|
     sum += element.to_i
    end
   end
   return sum
  end
end
