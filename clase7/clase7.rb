# Herencia
class Figura
  def perimetro
  end

  def lados
  end

  def area
  end
end

class Circulo < Figura
  attr_accessor :radio
  def initialize radio
    @radio = radio
  end

  def perimetro
    math::PI * 2 * @radio
  end

  def lados
    1
  end

  def area
    (math::PI * (@radio ** 2)
  end
end

class Triangulo < Figura
  def initialize base, lado1, lado2, altura
    @base = base
    @lado1 = lado1
    @lado2 = lado2
    @altura = altura
  end

  def perimetro
    @base + @lado1 + @lado2
  end

  def area
    (@base * @altura)/2
  end

  def lados
    3
  end
end

class Rectangulo < Figura
  attr_accessor :lado1, :lado2
  def initialize lado1, lado2
    @lado1 = lado1
    @lado2 = lado2
  end

  def perimetro
    2 * @lado1 + 2 * @lado2
  end
  def area
    @lado1 * @lado2
  end
end

class Cuadrado < Rectangulo
  def perimetro
    puts 'estas llamando al cuadrado especial'
    super # esto llama al metodo de la clase padre es decir recangulo y asì coge los parametros de alli para calcular el perimetro y se imprime cuando se pone super
  end
end

#Ejercicio Jerarquia Compañìa
#(Personas, Jefe, Empledos, etc)
#Puede contratar empleados, despedir empleados
#Puede hacer convenios con clientes

class Compania
  # numbre, nit, empleados, direccion, accionistas,
  #Jefe, clientes, proveedores, proyectos
  attr_reader :nombre, :nit, :empleados, :direccion, :accionistas, :jefe, :clientes, :proveedores, :proyectos
  def initialize hash_data #nombre, nit, empleados, direccion, accionistas, jefe, clientes, proveedores, proyectos
    @nombre = hash_data[:nombre]
    @nit = hash_data[:nit]
    @empleados = hash_data[:empleados]
    @direccion = hash_data[:direccion]
    @accionistas = hash_data[:accionistas]
    @jefe = hash_data[:jefe]
    @clientes = hash_data[:clientes]
    @proveedores = hash_data[:proveedores]
    @proyectos = hash_data[:proyectos]
  end
  def contratar hash_empleado
    @empleados << hash_empleado
  end
  def empleados
    @empleados
  end
end

compania1 = {nombre: 'this is it', nit: 24378654, empleados: [], direccion: 'carrera 43 #45a-23', accionistas: [], jefe: 'David Aguilar', clientes: [], proveedores: [], proyectos: []}
compania = Compania.new compania1

class Persona
#nombre, edad, cedula, visa, email, genero, idiomas
  attr_reader :nombre, :edad, :cedula, :visa, :email, :genero, :idiomas
  def initialize hash_data #nombre, edad, cedula, visa, email, genero, idiomas
    @nombre = hash_data[:nombre]
    @edad = hash_data[:edad]
    @cedula = hash_data[:cedula]
    @visa = hash_data[:visa]
    @email = hash_data[:email]
    @genero = hash_data[:genero]
    @idiomas = hash_data[:idiomas]
  end
end

class Empleado < Persona
  #Horario, sueldo, cargo, proyectos
  attr_reader :horario, :sueldo, :cargo, :proyecto
  def initialize hash_data #nombre, edad, cedula, visa, email, genero, idiomas, horario, sueldo, cargo, proyecto
    super hash_data #nombre, edad, cedula, visa, email, genero, idiomas
    @horario = hash_data[:horario]
    @sueldo = hash_data[:sueldo]
    @cargo = hash_data[:cargo]
    @proyecto = hash_data[:proyecto]
  end
end

class Cliente < Persona
  #tarjeta_de_credito, cuenta bancaria, proyectos
  attr_reader :tarjeta_de_credito, :cuenta_bancaria, :proyecto
  def initialize hash_data #nombre, edad, cedula, visa, email, genero, idiomas, tarjeta_de_credito, cuenta_bancaria, proyecto
    super nombre, edad, cedula, visa, email, genero, idiomas
    @tarjeta_de_credito = hash_data[:tarjeta_de_credito]
    @cuenta_bancarioa = hash_data[:cuenta_bancaria]
    @proyecto = hash_data[:proyecto]
  end
end

class Gerente < Empleado
# skills, documentos, areas
attr_reader :skills, :documentos, :areas
  def initialize hash_data #nombre, edad, cedula, visa, email, genero, idiomas, horario, sueldo, cargo, proyecto, skills, documentos, areas
    super hash_data #nombre, edad, cedula, visa, email, genero, idiomas, horario, sueldo, cargo, proyecto
    @skills = hash_data[:skills]
    @documentos = hash_data[:documentos]
    @areas = hash_data[:areas]
  end
end

class Desarrollador < Empleado
# lenduajes,logros
  attr_reader :lenguajes, :logros
  def initialize hash_data #nombre, edad, cedula, visa, email, genero, idiomas, horario, sueldo, cargo, proyecto, lenguajes, logros
    super hash_data #nombre, edad, cedula, visa, email, genero, idiomas, horario, sueldo, cargo, proyecto
    @lenguajes = hash_data[:lenguajes]
    @logros = hash_data[:logros]
  end
end

#Crear hash compania
#{nombre: 'this is it', nit: 24378654, empleados: [], direccion: 'carrera 43 #45a-23', accionistas: [], jefe: 'David Aguilar', clientes: [], proveedores: [], proyectos: []}
#crear hash cliente
#{nombre: 'Sebastian', edad: 23, cedula: 12948832, visa: 239847, email: 'email@email.com', genero: 'M', idiomas: 'Deutsch', tarjeta_de_credito: 'Mastercard 3648636237', cuenta_bancaria: 'Bancolombia 34768373', proyecto: 'Save the planet earth'}
#crear hash empleado
#{nombre: 'Santiago Echeverri', edad: 27, cedula: 257754684, visa: 0, email: 'santi@gmail.com', genero: 'M', idiomas: 'Farances', horario: 'L-V 8-5', sueldo: '2.000.000', cargo: 'Empleado', proyecto: 'Save planet earth'}
#crear hash Gerente
#{nombre: 'Mateo Olarte', edad: 24, cedula: 257784684, visa: 0, email: 'mateo@gmail.com', genero: 'M', idiomas: 'Ingles', horario: 'L-V 7-5', sueldo: '3.000.000', cargo: 'Gerente', proyecto: 'Save planet earth, fight global warming', skills: 'speak', documentos: 'a lot', areas: 'web developing'}
#crear hash Desarrollador
#{nombre: 'Sebastian Rodriguez', edad: 30, cedula: 2577846674, visa: 0, email: 'sebastian@gmail.com', genero: 'M', idiomas: 'Español', horario: 'L-S 7-5', sueldo: '2.000.000', cargo: 'Desarrollador', proyecto: 'Wannacry', skills: 'code', documentos: 'not that much', areas: 'android developing'}
##########################
class Universidad
  attr_accssesor :estudiantes
  def initialize
    @esudiantes = []
  end
end
#––––––––
class UniversidadEstudiante # intermedio
  attr_accssesor :estudiante_universidad
  def initialize
    @estudiante_universidad =[]
  end
  def find_universidad_by_estudiante estudiante_universidad
    @estudiante_universidad.select do |relacion|
      relacion[:estudiante]== estudiante
    end
  end
end
#-----------
class estudiante
  attr_accssesor :universidades
  def initialize
    @universidades = []
  end
end
