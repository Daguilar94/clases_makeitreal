veces = 5
numerador = 0
while numerador <= veces
  puts "El numerador esta en = #{numerador}"
  numerador += 1
end

veces = 5
numerador = 0
while numerador <= veces
  puts "ingresa un numero"
  entrada = gets.chomp
  break if entrada == "exit"
  puts "El numero ingresado es = #{entrada}"
  numerador += 1
end

#Ruby tiene un operador .times que permite ejecutar el codigo un numero de veces determinado
5.times do
  puts "ingresa un numero"
  entrada = gets.chomp
  break if entrada == "exit"
  puts "El numero ingresado es = #{entrada}"
  numerador += 1
end
#.times tiene la opcion de retornar una variable que cuenta las iteraciones

10.times do |i|
  puts "contador par: #{i}" if i % 2 == 0
end

# Exsiten metodos internos de Ruby que permite saber si es par o impar .odd? y .even?
a=5
a .odd?

# se puede hacer el times oneliner
5.times { |contador| puts contador}

#Ejecutar una instruccion infinitasveces hasta que haya un cntr c
loop do
  puts "Hola mundo"
end

loop do
  puts "ingresa un numero"
  entrada = gets.chomp
  break if entrada == "exit"
  puts "El numero ingresado es = #{entrada}"
end
#until

veces = 5
num = 0
until num == 5
  puts "num = #{num}"
  num += 1
end

#Ruby tiene una opcion de usar rango .. es excluyendo el ultimo y ... es incluyendolo
(20..60)

#tambien es asì ascendiente
20.upto(60) do |contador|
  puts contador
end

#y descendiente
60.downto(0) do |contador|
  puts contador
end

# ARREGLO
arreglo = ['simon','Andres',0,1,2,3,[4,5,6]]

clase=['simon','david','Sebastian','Mateo']
clase[clase.length-1] #devuelce el ultimo elemento
clase[1..clase.length-1] #Devuelve los elementos del puesto 1 hasta el ultimo puesto incluyendo el ultimo si fuera con ... excluyirìa el último
#.shift saca el primer elemento de un arreglo y lo guarda en una variable
nombre = clase.shift
#.pop saca el ultimo elemento de un arreglo y lo guarda en una variable
nombre = clase.shift
#.push arregla un elemento al ultimo puesto y hay una abreviacion que es <<
clase << 'martha'
clase.push 'martha'
#.insert+posicion+elemento metodo que inserta un elemento en alguna posicion
clase.insert 2, "yepeto"
# .delete_at + posicion elimina el elemento de la posicion insertada
clase.delete_at 4
# el string es un arreglo de caracteres
frase = "make it real"
frase[8..frase.length-1]
# Ruby tambien acepta rangos en letras, para hallar las letras de la a a la z se hace asì
a_to_z = ('a'..'z')
#para guardarlo en un vector
a_to_z.to_a

#Ejercicio eliminar las ultimas 3 letras del arreglo alfabeto
a_to_z = ('a'..'z')
alfabeto = a_to_z.to_a
(alfabeto.length-1).downto(l-3) do |i|
  alfabeto.delete_at i
end

#Recorrer los arreglos
clase.each do |1|
end

#Ejercicio imprimir solo la letra m
a_to_z = ('a'..'z')
alfabeto = a_to_z.to_a
alfabeto.each do |i|
  if i == 'm'
    puts i
  end
end

#.find do |miembro| encuentra un elemento en el arreglo y lo retorna y si no lo encuentra retorna nil
clase.find do |miembro|
miembro == 'david'
end

#Para encontrar el indice de algo en un arreglo existe un metodo
#.each_with_index do |letra, indice| que retorna las dos variables

#Ejercicio listar todas las letras que el indice no sea par
a_to_z = ('a'..'z')
alfabeto = a_to_z.to_a
alfabeto.each_with_index do |letra, indice|
  puts "#{indice} #{letra}" if !indice.even?
end

juego = []
juego << ['David', 100]
juego << ['Mateo',80]
juego << ['Sebastian', 120]
juego << ['Andres', 50]
juego << ['Felipe', 70]

#Crear otro arreglo con solo los puntajes
puntajes=[]
juego.each do |elemento|
  puntajes << elemento[1]
end

#map coge un arreglo y devuelve otro arreglo
juego = []
juego << ['David', 100]
juego << ['Mateo',80]
juego << ['Sebastian', 120]
juego << ['Andres', 50]
juego << ['Felipe', 70]
puntajes = []

puntajes = juego.map do |jugador|
  jugador[1]
end

#para hallar el valor máximo en un arreglo
puntajes.max
#para organizar el arreglo de menor a mayor
puntajes.sort
#para organizar el arreglo de mayor a menor
puntajes.sort.reverse

#para encontrar el indice de un elemento en el arreglo

puntajes.index 100
