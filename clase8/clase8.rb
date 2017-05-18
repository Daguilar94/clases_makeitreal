#----- CLASE 8 ------
#Modulos
extend module #lo que hace es incluir los etodos del modulo en la clase a nivel de clase
include module # lo que hace es incluir los metodos del modulo a la clase a nivel de instancia
# Se pueden e+incluir modulos que tiene ruby por defecto a las clases para tener mas metodos para unas
#por ejemplo los modulos: numerable, comparable, etc
module Inyector
  def prod
    res=1
    each do |item|
      res *= item
    end
    res
  end
end

class Array
  include Inyector
end

#Sort by es un metodo que se puede usar para comparar hash, por ejemplo para ordenar los productos en una ordes donde cada producto es un hash en un arreglo
#Que es yield?
