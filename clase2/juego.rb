jugador1 = 19
jugador2 = 19

if jugador1 < jugador2
  puts "gana jugador 2 con un puntaje de #{jugador2}"
elsif jugador2 < jugador1
  puts "gana jugador 1 con un puntaje de #{jugador1}"
else
  puts 'tienen el mismo puntaje'
end

edad = 0
puts 'hola mundo' if edad == 0 #Se puede escribir asì cuando son condicionales chiquitas

puts 'ingrese puntaje jugador 1'
pjugador1 = gets.chomp.to_i
puts 'ingrese ountaje jugador 2'
pjugador2 = gets.chomp.to_i

puts 'error input para jugador 1' if pjugador1 < 0 || pjugador1  > 21  #se puede hacer asi pero es mejor con unless para
puts 'error input para jugador 2' if pjugador2 < 0 || pjugador2  > 21  #que se entienda mejor como se muestra abajo

puts 'error input para jugador 1' unless pjugador1 >= 0 && pjugador1 <= 21
puts 'error input para jugador 2' unless pjugador2 >= 0 && pjugador2 <= 21

# tambien se puede hacer asì:

is_in_range = pjugador1 >= 0 && pjugador1 <= 21
puts 'error invalid input jugador 1' unless is_in_range

# o asì:

is_in_range = pjugador2 >= 0 && pjugador2 <= 21
puts 'error invalid input jugador 2' if !is_in_range

# Condicional ternario
# Tambièn se puede hacer asì:

puts is_in_range ? "continue, jugador 2" : "error invalid output"
