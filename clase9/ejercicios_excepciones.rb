# EJERCICIO 1
#  class NotYesOrNoError < StandardError
#  end
#
#  def aceptar
#    puts 'Desea aceptar'
#    ans=gets.chomp
#  end
#
#def yesOrNo? text
#  if text == 'y' || text == 'n'
#    true
#  else
#    raise NotYesOrNoError.new ('Se esperaba una y o una n')
#  end
#end
#retries = 1
#begin
#  ans=aceptar
#  yesOrNo? ans
#rescue NotYesOrNoError => e
#  puts "Error: #{e}"
#  if retries < 3
#    retries += 1
#    retry
#  end
#end

#EJERCICIO 2
module DB
  class UserNotFoundError < StandardError
  end

  class Usuario
    @@usuarios=[
      {name: 'David', email: 'd@gmail.com'},
      {name: 'Sebastian', email: 's@gmail.com'},
      {name: 'Mateo', email: 'm@gmail.com'},
    ]
    attr_reader :email, :nombre
    def initialize email, nombre
      @email = email
      @nombre = nombre
    end
    def mayuscula
      @nombre = self.nombre.upcase
    end

    def save
      @@usuarios << {name: @nombre, email: @email}
    end

    def self.usuarios
      @@usuarios
    end

    def self.find_email email
    ans = @@usuarios.find do |user|
        user[:email]==email
      end
      if ans != nil
        return ans
      else
        puts 'entro al error'
        raise UserNotFoundError.new ('Usuario no encontrado en la base de datos')
      end
    end
  end
end

begin
  DB::Usuario.find_email 'r@gmail.com'
rescue UserNotFoundError => e
  puts ('ERROR= #{e}')
end
