-- DROP SCHEMA ecommerce;

CREATE SCHEMA ecommerce AUTHORIZATION postgres;

-- DROP SEQUENCE ecommerce.address_id_seq;

CREATE SEQUENCE ecommerce.address_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.cart_id_seq;

CREATE SEQUENCE ecommerce.cart_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.cart_item_id_seq;

CREATE SEQUENCE ecommerce.cart_item_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.invoice_id_seq;

CREATE SEQUENCE ecommerce.invoice_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.payment_method_id_seq;

CREATE SEQUENCE ecommerce.payment_method_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.product_id_seq;

CREATE SEQUENCE ecommerce.product_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.role_id_seq;

CREATE SEQUENCE ecommerce.role_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.shipping_method_id_seq;

CREATE SEQUENCE ecommerce.shipping_method_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.store_id_seq;

CREATE SEQUENCE ecommerce.store_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.user_id_seq;

CREATE SEQUENCE ecommerce.user_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- ecommerce."role" definition

-- Drop table

-- DROP TABLE ecommerce."role";

CREATE TABLE ecommerce."role" (
	id serial4 NOT NULL,
	role_type varchar NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT role_pkey PRIMARY KEY (id)
);


-- ecommerce.shipping_method definition

-- Drop table

-- DROP TABLE ecommerce.shipping_method;

CREATE TABLE ecommerce.shipping_method (
	id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	price float8 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT shipping_method_pkey PRIMARY KEY (id)
);


-- ecommerce."user" definition

-- Drop table

-- DROP TABLE ecommerce."user";

CREATE TABLE ecommerce."user" (
	user_name varchar NOT NULL,
	role_id int4 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	id serial4 NOT NULL,
	CONSTRAINT user_pkey PRIMARY KEY (id),
	CONSTRAINT role_id FOREIGN KEY (role_id) REFERENCES ecommerce."role"(id)
);


-- ecommerce.address definition

-- Drop table

-- DROP TABLE ecommerce.address;

CREATE TABLE ecommerce.address (
	user_id int4 NOT NULL,
	"name" varchar NOT NULL,
	details text NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	id serial4 NOT NULL,
	CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES ecommerce."user"(id)
);


-- ecommerce.cart definition

-- Drop table

-- DROP TABLE ecommerce.cart;

CREATE TABLE ecommerce.cart (
	id serial4 NOT NULL,
	user_id int4 NOT NULL,
	total_price float8 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT cart_pkey PRIMARY KEY (id),
	CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES ecommerce."user"(id)
);


-- ecommerce.invoice definition

-- Drop table

-- DROP TABLE ecommerce.invoice;

CREATE TABLE ecommerce.invoice (
	id serial4 NOT NULL,
	user_id int4 NOT NULL,
	shipping_method_id int4 NOT NULL,
	cart_id int4 NOT NULL,
	invoice_number varchar(255) NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT invoice_pkey PRIMARY KEY (id),
	CONSTRAINT cart_id FOREIGN KEY (cart_id) REFERENCES ecommerce.cart(id),
	CONSTRAINT shipping_method_id FOREIGN KEY (shipping_method_id) REFERENCES ecommerce.shipping_method(id),
	CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES ecommerce."user"(id)
);


-- ecommerce.payment_method definition

-- Drop table

-- DROP TABLE ecommerce.payment_method;

CREATE TABLE ecommerce.payment_method (
	id serial4 NOT NULL,
	invoice_id int4 NOT NULL,
	"name" varchar(255) NOT NULL,
	amount float8 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT payment_method_pkey PRIMARY KEY (id),
	CONSTRAINT invoice_id FOREIGN KEY (invoice_id) REFERENCES ecommerce.invoice(id)
);


-- ecommerce.store definition

-- Drop table

-- DROP TABLE ecommerce.store;

CREATE TABLE ecommerce.store (
	id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	user_id int4 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT store_pkey PRIMARY KEY (id),
	CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES ecommerce."user"(id)
);


-- ecommerce.product definition

-- Drop table

-- DROP TABLE ecommerce.product;

CREATE TABLE ecommerce.product (
	id serial4 NOT NULL,
	store_id int4 NOT NULL,
	"name" varchar(255) NOT NULL,
	quantity int4 NOT NULL,
	price float8 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT product_pkey PRIMARY KEY (id),
	CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES ecommerce.store(id)
);


-- ecommerce.cart_item definition

-- Drop table

-- DROP TABLE ecommerce.cart_item;

CREATE TABLE ecommerce.cart_item (
	id serial4 NOT NULL,
	store_id int4 NOT NULL,
	cart_id int4 NOT NULL,
	product_id int4 NOT NULL,
	quantity float8 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	deleted_at timestamp NULL,
	CONSTRAINT cart_item_pkey PRIMARY KEY (id),
	CONSTRAINT cart_id FOREIGN KEY (cart_id) REFERENCES ecommerce.cart(id),
	CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES ecommerce.product(id),
	CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES ecommerce.store(id)
);