#***HASHES***#

  persona ={
  'name' => 'Simon',
  1 => 'hola',
  [1,2,3,4,5] => "equipo",
  }
  persona['name'] #Retorna 'simon'
  persona[1] #Retorna 'hola'
  persona[[1,2,3,4,5]] # Retorna "equipo"

  # Ejercicio 1

  personas = [{nombre: 'David', apellido: 'Aguilar', direccion: 'carrera 84 #34A-55'},
              {nombre: 'Mateo', apellido: 'Olarte', direccion: 'calle 44C #92-55'},
              {nombre: 'Santiago', apellido:'Zapata', direccion: 'calle 56 #45B-44'},
              {nombre: 'Felipe', apellido: 'Correa', direccion: 'carrera 25 #56D-22'},
              {nombre: 'Camilo', apellido: 'Burgos', direccion: 'carrera 75 #45-65'}]

personas.each do |item|
  puts "#{item[:nombre]} #{item[:apellido]} #{item[:direccion]}"
end

#se pueden eliminar keys en los HASHES

alumno.delete :nombre # Devuelve el valor que elimino del HASHES

# Crear un key en caso de que no estè

alumno.fetch # saca un error en caso de que no exista pero se puede poner para que tenga un valor por defecto y lo agrega al HASH asì:
alumno.fetch 'email','ex@examplo.com' # Si no hay email, utiliza ex@examplo.com

#Los hashes tienen una funcion para retornar los keys o los valores como arreglo asì:
alumno.keys
alumno.values

states = {
  'Oregon' => 'OR',
  'Florida' => 'FL',
  'California' => 'CA',
  'New York' => 'NY',
  'Michigan' => 'MI'
}

cities ={
  'CA' => 'San Frncisco',
  'MI' => 'Detroit',
  'FL' => 'Jacksonville'
}

states.each do |keys, values|
  if cities[values] == nil
    puts "#{keys} --- no tiene ciudad"
  else
    puts "#{keys} ---- #{cities[values]}"
  end
end

#arreglos

.each_char # Permite recorrer un string
.split(' ') o split "/n" # Divide el string por los espacios y devuelve un arreglo con las partes
.upcase #Convierte a mayusculas
.downcase # Conviente a minusculas
.capitalize # La primera letra mayuscula y las otras minusculas
.join ('---') # concatena con el simbolo o simbolos que se quieran
# Se pueden hacer multistrings
A= <<-AQUI
hola
esto es
un string de
varias lineas
AQUI

·.strip #quitar algunos caracteres (leer màs, no entendi bien)
.gsub 'a','no' #sustituye todas las a por no
.empty? #pregunta si esta vacio
"hola" * 10 #devuelve holaholahola 10 veces
#Ejercicio

csv = <<-BEGIN
name,apellido,edad,cc
simon,escobar,25,1234
santiago, escobar,22,12345
maria,se los angeles,40,12345
BEGIN

A=csv.split "\n"
arregloFinal =[]
A.each do |string|
  arregloFinal << string.split(',')
end
resultado=[]
arregloFinal.each do |arreglo|
  arreglo.each do |elemento|
    resultado << elemento
  end
end
