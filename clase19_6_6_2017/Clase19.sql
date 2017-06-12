rails d model Product -- Destruir el modelo

rails new name -d postgresql --Xrear un nuevo proyecto con postgres como base de datos por defecto

rails g migration AddPriceToProducts price:integer
rails db:migrate

rails d migration AddPriceToProducts
rails db:migrate

rails g migration RemoveQuantityFromProducts quantity -- Elimina la columna quantity

reils db:migrate:status

rails db:rollback -- se devuelve a como estaba antes de la migracion

product.all.map(&:name)

rails generate migration RenamePriceToProducts price:integer

y en las migraciones hacer lo siguiente:

class RenamePriceToProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :price, :price_usd
  end
end

Para devolverse sin rollback

class RenamePriceToProducts < ActiveRecord::Migration[5.1]
  def change
    reversible do |mig|
    mig.up do
      change_column :products, :price_usd, :string
      Product.all.each do |product|
        product.price_usd = product.price_usd.to_s
        product.save
      end
    end

    mig.down do |variable|
    change_column :products, :price_usd, 'integer USING CAST'
  end
end

-----Clase 20----

rails db:drop  Borrar la base de datos

no puede hacer el reversible, entonces hay que hacerlo manualmente haciendo dos metodos llamados up y down cuando no se tiene el metodo change.
Si si se tiene el metodo change, se indtroduce un reversible dentro de este metodo

-----------------------------------------------
PARA HACER EN LA CASA

Agregar la columna username a la tabla products
hacer el rollback de las dos formas
------------------------------------------------

rails g model Order product:references user:references

rails db:seed

rails g migration CreateJoinTableProductOrder product:references order:references

rails g migration RemoveProductFromOrder product:references

o1 = Order.new()

meetups medellin.rb -- Buscar empleo y charlas tienen github

u1=User.create(username: 'daguilar', password:'1234', email:'d@g.com')
u2=User.create(username: 'Molarte', password:'5678', email:'m@g.com')
p1 = Product.find 1
p2 = Product.find 2
p3 = Product.find 3
p4 = Product.find 4
new = []

o1 = Order.create(user: u1)
o2 = Order.create(user: u1)
o3 = Order.create(user: u2)
o4 = Order.create(user: u1)

o1.products << p1
o1.products << p2
o2.products << p3
o2.products << p4
o3.products << p1
------------ Clase 20 Jueves 8 Junio -------------

rails g model Adress country:string city:string zip:integer user:references
rails g migration AddUserToAdress user:references

ad1 = Adress.create(country: 'Colombia', city: 'Medellin', zip: 0000)

VALIDACIONES

reglas para los modelos corren en runtime

Errors se va llenando cuando la operacion l¡no pasan la VALIDACION
---------------------------------------
class User < ApplicationRecord
  has_many :orders
  has_many :adresses

  validates :email, uniqueness: true
  validates :username, uniqueness: {message: 'parce este %{attribute} %{value} ya existe'}
  validates :username, length: {in: 5..50}
end
---------------------------------------

user = User.new username: 'aaaaaa', password: '123456789', email: 'd@g.com'
user = User.new username: 'jjjjjj', password: '111111111', email: 'j@g.com'

-------- Clase 21 Viernes 9 Junio ----------

Verificar si el pais es us, debe tener un estado. Para esto se pone lo siguiente en el modelo:

validates :state, presence: true, if: :us?

def us?
  country == 'us'
end

cuando corro el error.messages de un pais creado con us, en la consola me aparece el error:
:state=>["can't be blank"]}

%w(co us)--> esto crea el arreglo ['co', 'us']

Para validar que el pais este entre una lista que se tienes se pone la siguiente validacion en el modelo:

validates :country, inclusion: {in: %w(co us)}

---SCOPES-------

scope :in_inventory, -> { where('quantity > :qty', qty: 0)}
scope :not_expired, -> { where expired: false}
scope :order_price, -> {order :price}

scope :with_products, -> (id){
  includes(:products).find(id)
} -- Con esta funcion solo se hace un query para incluir muchos productos a una misma orden y se evita hacer el siguiente codico con loops:

all.each do |order|
  order.products.each do |product|
    puts "PRODUCT= #{product.sku}"
  end
end

default scope :in_inventory, -> {where('quantity <¡> :qty', qty: 0)} --> se ejecuta en todos los querys. Es util pero peligrosos

Callbacks

Reciben bloque

Por ejemplo normalizar los datos anntes de validar en before_validation

before tratar con cuidado. Generalmente la gente trata de hacer cosas en los before after actions
 solo se pueden cancelar los callbacks con un false como treturn o una excepcion en los before y con active reccord invalid o rollback en los after

 3.days.ago
3.seconds.ago

Servicio de google para notificaciones

gema gcm
