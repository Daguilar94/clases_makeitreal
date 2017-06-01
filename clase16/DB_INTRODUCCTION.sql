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
quantuty int DEFAULT 1,
);

products                OrderDetails                        Orders
id(1) Salchichon        id(1) p_id(1) o_id(1)               1 O_001 track_001
2 Limon                 id(2) p_id(3) o_id(1)
3 Pan                   id(3) p_id(4) o_id(1)
