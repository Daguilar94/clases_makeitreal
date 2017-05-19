#---Clase 9 -----
#Continuacion modulos

module Ventas
  class customer
    def initialize name, orders
      @name = name
      @orders = orders
    end
  end
end

module  Seguros
  class customer
    def initialize name, period
      @name = name
      @period = period
    end
  end
end

  class Order
    include Ventas
    include Seguros

    def initialize products
      @products = products
    end
  end

  class Order
    attr_reader :details
    def initialize details
      @details = products
    end
  end

#En este caso gana la ultima clase Order,por esto es bueno encapsular las clases que se llamen igual en modulos diferentes

## ---- EXEPCIONES Y ERRORES -----

# Hay variaf formas de hacerlas

raise 'hols como estan' #Runtime error 'hola como estan'
raise StandardError.new 'Hello class' # Standard error: 'hello class'
raise StandardError, 'Hola' #StandardError: hola

#tambien hay una clausula Fail

fail 'Falle al escribir' #Runtime error: Falle al escribir

#Para capturar los errores se comienza un bloque

class MyCustomError < StandardError
end

def it_will_blow_up
#raise 'Me expplotè'
# 6/0


raise myCustomError.new 'Fallo un condicional'
end



begin
  #it_will_blow_up
  text = gets.chomp
  if text == 'incorrect'
    raise MyCustomError.new "No esperaba #{texto}, esperaba correct"
  end
rescue RuntimeError => error
  puts "RUNTIME_ERROR= #{error.message} #{error.backtrace}"
rescue StandardError => error
  puts "STANDARD_ERROR = #{error}"
rescue MyCustomError => error
  puts "MY_CUSTOM_ERROR = #{error}"
else
  #Aqui va el default, cuando uno no sabe cual fue el error
  puts 'no se que hacer'
end


def open_file
  File.open File.read
end
  def printer file
    while line = file.readline
      puts "LINE = #{line}"
    end
  end

  file_name = gets.chomp
  file = open_file file_name
  begin
    printer file
  rescue EOFError => error
    puts "Ya llegamos al final del archivo #{error}"
  ensure
    puts "closing files"
    file.close
  end

#EJERCICIO ACEPTAR
class NotYesOrNoError < StandardError
end
begin
def aceptar
  try = 1
  ans = 't'
  while (try <= 3) && ((ans != 'y') && (ans != 'n'))
    puts "desea aceptar?"
    ans = gets.chomp.to_s
    if ans != 'y' && ans != 'n'
      raise NotYesOrNoError.new "La letra ingresada no es ni 'y' ni 'n'"
    else
      return true
    end
  end
  try += 1
end
rescue NotYesOrNoError => error
  puts "ocurrio el error #{error}"
  retry
end

#Ejercicio usuarios

module DB
  class UserNotFoundError < StandardError
  end

  class Usuario
    @@usuarios = ['Sebastian@gmail.com','David@gmail.com','Santiago@gmail.com','MAteo@gmail.com']

    def save
      @@usuarios << self
    end

    def self.find_email email
      @@usuarios.find do |user|
        if  email == user != nil
          user
        else
          raise UserNotFoundError.new 'Usuario no encontrado'
        end
      end
    end

  begin
    DB::Usuario.find_email email
  rescue UserNotFoundError => error
    puts "Error del usuario no encontrado"
  end
end


#Solucion
module DB
  class Usuario
    @@usuarios = []

    attr_reader :email
    def initialize email
      @email = email
    end

    def save
      @@usuario << self
    end

    def self.find email
      usuario = @@usuarios.find {|usuario| usuario.email == usuario}
      raise UserNotFoundError.new "User with email #{email} does not exist" unless usuario
      usuario
    end
  end

  #En la ejecucuion se pone

begin
  DB::Usuario.find 'yep@ex.com'
rescue DB::UserNotFoundError
  puts "ERROR #{e}"
end

## GEMAS
gem install faker

require faker

gem  install bundler
#bcrypt para encriptar contraseña

#SE ME FUE

BUNDLER CREATE GEM
BUNDLER.IO
