create table t_user(
    user_id int NOT NULL primary key AUTO_INCREMENT comment 'primary key',
    user_name varchar(50) NOT NULL,
    user_surnames varchar(50)NOT NULL,
    user_address varchar(50)NOT NULL,
    user_email varchar(50)NOT NULL,
    user_password varchar(100)NOT NULL,
    user_telephone varchar(9)NOT NULL,
    user_image varchar(200),
    user_score double NOT NULL DEFAULT 0,
    user_point double NOT NULL DEFAULT 0,
    user_gender varchar(20),
    user_location text,
    user_birth_date date,
    user_menbership_level int,
    user_status int

);
create table t_document_type(
    document_type_id int not null primary key AUTO_INCREMENT ,
    document_type_code varchar(10),
    document_type_name varchar(20),
    document_type_status int
);
create table t_vehicle_type(
    vehicle_type_id int not null primary key AUTO_INCREMENT ,
    vehicle_type_name varchar(20),
    vehicle_type_image varchar(100),
    vehicle_type_status int
);
create table t_driver(
    driver_id int not null primary key AUTO_INCREMENT ,
    driver_name varchar(50),
    driver_surnames varchar(50),
    driver_number_document varchar(20),
    driver_address varchar(100),
    driver_email varchar(50),
    driver_password varchar(50),
    driver_telephone varchar(9),
    driver_image_profile varchar(100),    
    driver_image_document varchar(100),
    driver_score double,
    driver_gender varchar(10),
    driver_birth_date date,    
    driver_status int,
    id_document_type int,
    id_vehicle_type INT,
    FOREIGN KEY (id_document_type)REFERENCES t_document_type(document_type_id),
    FOREIGN KEY (id_vehicle_type)REFERENCES t_vehicle_type(vehicle_type_id)
);
create table t_soat(
    soat_id int not null primary key AUTO_INCREMENT ,
    soat_code varchar(20),
    soat_image varchar(100),
    soat_description text,
    soat_status int,
    id_driver int,
    FOREIGN KEY (id_driver)REFERENCES t_driver(driver_id)
);
create table t_license(
    license_id int not null primary key AUTO_INCREMENT ,
    license_code varchar(20),
    license_image varchar(100),
    license_description text,
    license_status int,
    id_driver int,
    FOREIGN KEY (id_driver)REFERENCES t_driver(driver_id)
    
);
create table t_bussines_category(
    bussines_category_id int not null primary key AUTO_INCREMENT ,
    bussines_category_name varchar(50),
    bussines_category_image varchar(100),
    bussines_category_description varchar(100),
    bussines_category_status int,
    bussines_category_order int
);
create table t_bussines(
    bussines_id int not null primary key AUTO_INCREMENT ,
    bussines_code varchar(100),
    bussines_owner varchar(100),
    bussines_name varchar(100),
    bussines_brand varchar(50),
    bussines_telephone varchar(9),
    bussines_address varchar(50),
    bussines_latlng varchar(50),
    bussines_image varchar(100),
    bussines_date_open varchar(20),
    bussines_date_close varchar(20),
    bussines_score double,
    id_bussines_category int,
    FOREIGN KEY (id_bussines_category)REFERENCES t_bussines_category(bussines_category_id)

);
create table t_ingredient(
    ingredient_id int not null primary key AUTO_INCREMENT,
    ingredient_name varchar(50),
    ingredient_image varchar(100),
    ingredient_status int
);
create table t_type_product(
    t_type_product_id int not null primary key AUTO_INCREMENT,
    t_type_product_name varchar(50)
);
create table t_product(
    product_id int not null primary key AUTO_INCREMENT ,
    product_name varchar(50),
    product_price double,
    pruduct_image varchar(100),
    product_description text,
    product_time varchar(20),
    product_score double,
    product_status int,
    id_bussines int,
    id_type_product int,/*pasivo*/
    FOREIGN KEY (id_bussines)REFERENCES t_bussines(bussines_id),
    FOREIGN KEY (id_type_product)REFERENCES t_type_product(t_type_product_id)

);
create table t_producto_ingredient(
    product_ingredient_id int not null primary key AUTO_INCREMENT,
    product_ingredient_porcent double,
    product_ingredient_description text,
    id_ingredient int,
    id_product int,
    FOREIGN KEY (id_ingredient)REFERENCES t_ingredient(ingredient_id),
    FOREIGN KEY (id_product)REFERENCES t_product(product_id)
);
create table t_offer(
    offer_id int not null primary key AUTO_INCREMENT,
    offer_name varchar(50),
    offer_price double,
    offer_image varchar(100),
    offer_description text,
    offer_date_start DATETIME ,
    offer_date_end DATETIME ,
    ofeer_score double,
    offer_status int
);
create table t_product_offer(
    t_product_offer_id int not null primary key AUTO_INCREMENT,
    id_offer int,
    id_product int,
    FOREIGN KEY (id_offer)REFERENCES t_offer(offer_id),
    FOREIGN KEY (id_product)REFERENCES t_product(product_id)
);
create table t_type_payment(
 type_payment_id int not null primary key AUTO_INCREMENT,
 type_payment_name varchar(20),
 type_payment_image varchar(100),
 type_payment_status int
);
create table t_order(
    order_id int not null primary key AUTO_INCREMENT,
    order_date datetime,
    order_adress_bussines varchar(100),
    order_latlong_bussines varchar(50),
    order_adress_user varchar(100),
    order_latlong_user varchar(50),
    order_pryce_food double,
    order_pryce_delivery double,
    order_pryce_total double,
    order_status_food int,/*error de cocina*/
    order_status_payment int,
    order_description text,
    order_status int,
    id_driver int,
    id_user int,
    id_type_payment int,
    FOREIGN KEY (id_user)REFERENCES t_user(user_id),
    FOREIGN KEY (id_type_payment)REFERENCES t_type_payment(type_payment_id)
);
create table t_order_item(
    order_item_id int not null primary key AUTO_INCREMENT,
    order_item_product varchar(50),
    order_item_product varchar(100),
    order_item_amount double,
    order_item_pryce double,
    order_item_total double,
    order_item_date datetime,
    id_order int,
    id_bussines int,
    FOREIGN KEY (id_order)REFERENCES t_order(order_id),
    FOREIGN KEY (id_bussines)REFERENCES t_bussines(bussines_id)
);
create table t_role(
    role_id int not null primary key AUTO_INCREMENT,
    role_name varchar(50),
    role_permision JSON
);
create table t_people(
    people_id int not null primary key AUTO_INCREMENT,
    people_name varchar(50),
    people_email varchar(50),
    people_password varchar(100),
    people_phone varchar(13),
    people_bussines_id int,
    people_image varchar(100),
    people_status int,
    id_role int,
    FOREIGN  KEY  (id_role) REFERENCES t_role(role_id)

);

/*

tabla sugerencias

id usuario

detalle

tabla caja  con intermedia para moto y usuario

tipos de usuario

admin

cliente

---> caja de mto a delivery
--> caja de  negocio a items
--> caja de admin a item 6 delivery

*/
