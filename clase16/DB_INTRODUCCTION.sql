Se inicializa la base de datos con psql

Se crea la base de datos con:
creatr database name
Se ingresa a la base de datos con:
\c name


CREATE table NAME(
id numeric DEFAULT 0  NOT NULL
name varchar (20)
);
------------------------------------------------------------
CREATE table products(
id serial PRIMARY KEY,
name varchar (20) NOT NULL,
price int NOT NULL
);

CREATE table orders(
id serial PRIMARY KEY,
order_no varchar (20) NOT NULL,
tracking_no varchar (50) NOT NULL
);
-------------------------------------------------------------
INSERT INTO products (name, price) VALUES ('Guaro', 23000);

ALTER TABLE products alter column name type varchar(255); ----- cambiar tipo de una variable
DROP TABLE ; ------ eliminar tabla

pg_dump ____ herramienta back up de db

\c
\d
\t
select * from products;
select id from products;
select * from products where price <= 40000
select * from products where price > 40000

actualizar los productos que tengan Guaro y ponerles un precio

update productos set price = 20000  PONER WHERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--------------------------------------------------------------
CREATE table order_details(
id serial PRIMARY KEY,
product_id int REFERENCES products(id),
order_id int REFERENCES orders(id) ON DELETE CASCADE,
quantity int DEFAULT 1,
);

products                OrderDetails                        Orders
id(1) Salchichon        id(1) p_id(1) o_id(1)               1 O_001 track_001
2 Limon                 id(2) p_id(3) o_id(1)
3 Pan                   id(3) p_id(4) o_id(1)
___________________________________________________________________

Clase 17 jueves

CREATE table rooms(
room_num serial PRIMARY KEY,
capacity int NOT NULL,
person_id int REFERENCES users(id)
);

CREATE table users(
id serial PRIMARY KEY,
name varchar (40) NOT NULL
);

insert into rooms (room_num, capacity) values (1, 2);
insert into rooms (room_num, capacity) values (2, 2);
insert into rooms (room_num, capacity) values (3, 3);
insert into rooms (room_num, capacity) values (4, 1);
insert into rooms (room_num, capacity) values (5, 6);
insert into rooms (room_num, capacity) values (6, 4);
insert into users (id, name) values (0000, 'David');
insert into users (id, name) values (0001, 'Mateo');
insert into users (id, name) values (0002, 'Sebastian');
insert into users (id, name) values (0003, 'Santiago');
insert into users (id, name) values (0004, 'Camila');
insert into users (id, name) values (0005, 'Andrea');

esto se puede hacer: update rooms set room_num= 101 where room_num=1;


update rooms set person_id = 1 where room_num = 101;
update rooms set person_id = 0000 where room_num = 101;
update rooms set person_id = 0001 where room_num = 102;
update rooms set person_id = 0005 where room_num = 106;

select * from users, rooms where users.id = rooms.person_id;
select rooms from rooms, users where users.id = rooms.person_id;
select rooms.* from rooms, users where users.id = rooms.person_id; Para que se vea bonito
select * from rooms join users on rooms.person_id = users.id;
select * from rooms join users on  rooms.person_id = users.id where users.name = 'David';

RIGHTS AND LEFTS

select * from rooms left join users on rooms.person_id = users.id;
select * from rooms right join users on rooms.person_id = users.id;

EJERCICIO PRODUCTOS ORDENES

CREATE table products(
id serial PRIMARY KEY,
name varchar (20) NOT NULL,
price int NOT NULL
);

CREATE table orders(
id serial PRIMARY KEY,
order_no varchar (20) NOT NULL,
tracking_no varchar (50) NOT NULL
);

CREATE table order_details(
id serial PRIMARY KEY,
product_id int REFERENCES products(id),
order_id int REFERENCES orders(id) ON DELETE CASCADE,
quantity int DEFAULT 1
);

insert into products (name, price) values ('Zanahoria', 3000);
insert into products (name, price) values ('Aguacate', 800);
insert into products (name, price) values ('Nintendo switch', 100000);
insert into products (name, price) values ('TV', 400000);
insert into products (name, price) values ('tenis', 9000);
insert into products (name, price) values ('chocolatina', 200);

insert into orders (order_no, tracking_no) values ('AA00', '0000');
insert into orders (order_no, tracking_no) values ('AA01', '0001');
insert into orders (order_no, tracking_no) values ('AA02', '0010');
insert into orders (order_no, tracking_no) values ('AA03', '0011');

insert into order_details (product_id, order_id, quantity) values (2, 3, 4);
insert into order_details (product_id, order_id, quantity) values (5, 1, 2);
insert into order_details (product_id, order_id, quantity) values (3, 2, 1);

que details tiene la orden 1

select * from orders join order_details on order_details.order_id = orders.id where orders.id = 1
----------------------------------------------------------------------------------------------------
RAILS

crear un modelo desde la consola

rails g model product sku:text quantity:integer name:text
rails db:create
rails db:migrate

p= Product.new

ACTIVE RECORD

p.save
product = Product.new
product.sku = 'sku_002'
product.quantity = 1
product.name = 'Hamburguesa'
product.save

product1 = Product.new
product.sku = 'sku_003'
product.quantity = 2
product.name = 'Perro'
product.save

product2 = Product.new
product.sku = 'sku_004'
product.quantity = 5
product.name = 'Chuzo'
product.save

product3 = Product.new
product.sku = 'sku_005'
product.quantity = 4
product.name = 'Papas'
product.save

Product.count

Product.find

Product.all

Product.find 1

Product.where name: 'churrasco'

Product.select(:name, :sku).find1

Product.create sku: 'sku_006', name: 'Yolo', quantity: 2

Product.where(id: 1).and(sku: 'sku_003')

Product.find_by ----> esto es sin id

Product.limit

Product.offset(1).limit 5

reload! recargar los modelos

Rails guides -- active record bases, query interfaces
