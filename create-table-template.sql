create table t_user(
    user_id varchar(50) not null primary key,
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
    user_location varchar(100),
    user_birth_date date,
    user_membership_level int,
    user_status int,
    user_date_created datetime,
    user_date_edit datetime
);
create table t_document_type(
    document_type_id varchar(50) not null primary key,
    document_type_code varchar(10),
    document_type_name varchar(20) COMMENT 'DNI, PASAPORTE',
    document_type_status int
);
create table t_vehicle_type(
    vehicle_type_id varchar(50) not null primary key,
    vehicle_type_name varchar(20),
    vehicle_type_image varchar(100),
    vehicle_type_status int
);
create table t_city(
    city_id varchar(50) not null primary key,
    city_cod varchar(10),
    city_name varchar(20),
    city_status int  
);

create table t_driver(
    driver_id varchar(50) not null primary key,
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
    driver_city varchar(100),
    driver_date_created datetime,
    driver_date_edit datetime,
    id_document_type varchar(50) not null,
    id_vehicle_type varchar(50) not null,
    id_city varchar(50) not null ,
    FOREIGN KEY (id_document_type)REFERENCES t_document_type(document_type_id),
    FOREIGN KEY (id_vehicle_type)REFERENCES t_vehicle_type(vehicle_type_id),
    FOREIGN KEY (id_city)REFERENCES t_city(city_id)
);
create table t_soat(
    soat_id varchar(50) not null primary key,
    soat_code varchar(20),
    soat_image varchar(100),
    soat_description text,
    soat_status int,
    id_driver varchar(50) not null,
    FOREIGN KEY (id_driver)REFERENCES t_driver(driver_id)
);
create table t_license(
    license_id varchar(50) not null primary key,
    license_code varchar(20),
    license_image varchar(100),
    license_description text,
    license_status int,
    id_driver varchar(50) not null,
    FOREIGN KEY (id_driver)REFERENCES t_driver(driver_id)
    
);
create table t_bussines_category(
    bussines_category_id varchar(50) not null primary key,
    bussines_category_name varchar(50),
    bussines_category_image varchar(100),
    bussines_category_description varchar(100),
    bussines_category_status int,
    bussines_category_order int
);
create table t_bussines(
    bussines_id varchar(50) not null primary key,
    bussines_code varchar(100),
    bussines_owner varchar(100),
    bussines_name varchar(100),
    bussines_brand varchar(50),
    bussines_telephone varchar(9),
    bussines_email varchar(50),
    bussines_password varchar(100),
    bussines_address varchar(50),
    bussines_latlng varchar(50),
    bussines_image varchar(100),
    bussines_date_open varchar(20),
    bussines_date_close varchar(20),
    bussines_city varchar(100),
    bussines_score double,
    id_bussines_category varchar(50) not null,
    FOREIGN KEY (id_bussines_category)REFERENCES t_bussines_category(bussines_category_id)

);
create table t_ingredient(
    ingredient_id varchar(50) not null primary key,
    ingredient_name varchar(50),
    ingredient_image varchar(100),
    ingredient_status int
);
create table t_product_category(
    product_category_id varchar(50) not null primary key,
    product_category_name varchar(50) COMMENT ' BEBIDA, JUGO, CEVICHE',
    product_category_image varchar(100),
    product_category_desdcription varchar(100),
    product_category_status int,
    prodcut_category_order int
);
create table t_product(
    product_id varchar(50) not null primary key,
    product_name varchar(50),
    product_price double,
    pruduct_image varchar(100),
    product_description text,
    product_time varchar(20),
    product_score double,
    product_status int,
    id_bussines varchar(50) not null,
    id_product_category varchar(50) not null,
    FOREIGN KEY (id_bussines)REFERENCES t_bussines(bussines_id),
    FOREIGN KEY (id_product_category)REFERENCES t_product_category(product_category_id)

);
create table t_producto_ingredient(
    product_ingredient_id varchar(50) not null primary key,
    product_ingredient_porcent double,
    product_ingredient_description text,
    id_ingredient varchar(50) not null,
    id_product varchar(50) not null,
    FOREIGN KEY (id_ingredient)REFERENCES t_ingredient(ingredient_id),
    FOREIGN KEY (id_product)REFERENCES t_product(product_id)
);
create table t_offer(
    offer_id varchar(50) not null primary key,
    offer_name varchar(50),
    offer_price double,
    offer_image varchar(100),
    offer_description text,
    offer_type varchar(20) DEFAULT 'OFERTA',
    offer_date_start DATETIME ,
    offer_date_end DATETIME ,
    ofeer_score double,
    offer_status int,
    id_bussines varchar(50) not null,   
    FOREIGN KEY (id_bussines)REFERENCES t_bussines(bussines_id)
);
create table t_product_offer(
    t_product_offer_id varchar(50) not null primary key,
    id_offer varchar(50) not null,
    id_product varchar(50) not null,
    FOREIGN KEY (id_offer)REFERENCES t_offer(offer_id),
    FOREIGN KEY (id_product)REFERENCES t_product(product_id)
);
create table t_type_payment(
 type_payment_id varchar(50) not null primary key,
 type_payment_name varchar(20),
 type_payment_image varchar(100),
 type_payment_status int
);
create table t_order_status(
    order_status_id varchar(50) not null primary key,
    order_status_name varchar(50) comment 'PEDIDO, PENDIENTE, COCINA, EN CAMINO, RESIVIDO, PAGADO, CANCELADO' 
);
create table t_role(
    role_id varchar(50) not null primary key,
    role_name varchar(50) COMMENT 'ADMIN, CAJA,ETC.',
    role_permision JSON
);
create table t_people(
    people_id varchar(50) not null primary key,
    people_name varchar(50),
    people_email varchar(50),
    people_password varchar(100),
    people_phone varchar(13),
    people_bussines_id int,
    people_image varchar(100),
    people_city varchar(100) COMMENT 'ciudad de ubicacion',
    people_status int,
    id_role varchar(50) not null,
    FOREIGN  KEY  (id_role) REFERENCES t_role(role_id)

);
create table t_order(
    order_id varchar(50) not null primary key,
    order_date datetime,
    order_adress_bussines varchar(100),
    order_latlong_bussines varchar(50),
    order_adress_user varchar(100),
    order_latlong_user varchar(50),
    order_pryce_food double,
    order_pryce_delivery double,
    order_pryce_total double,
    order_description text,
    order_status int,
    id_city varchar(50) not null COMMENT 'para identificar a que ciudad pertense.',
    id_driver varchar(50) default null,
    id_cash_driver varchar(50) default  null,
    id_user varchar(50) not null,
    id_type_payment varchar(50) not null,    
    id_cash_people varchar(50) default null,
    id_order_status varchar(50) not null,
    FOREIGN KEY (id_user)REFERENCES t_user(user_id),
    FOREIGN KEY (id_type_payment)REFERENCES t_type_payment(type_payment_id),
    FOREIGN KEY (id_order_status)REFERENCES t_order_status(order_status_id),
    FOREIGN KEY (id_city)REFERENCES t_city(city_id)

);
create table t_cash_status(
    cash_status_id varchar(50) not null primary key,
    cash_status_name varchar(20) COMMENT 'PENDIENTE, PAGADO, ARQUEADO.'
);
create table t_cash_bussines(
    cash_bussines_id varchar(50) not null primary key,
    cash_bussines_correlative int,
    cash_bussines_start datetime,
    cash_bussines_end datetime,
    cash_bussines_description varchar(50),
    id_cash_status varchar(50) not null,
    id_bussines varchar(50) not null,
    FOREIGN  KEY  (id_cash_status) REFERENCES t_cash_status(cash_status_id),
    FOREIGN  KEY  (id_bussines) REFERENCES t_bussines(bussines_id)

);
create table t_order_item(
    order_item_id varchar(50) not null primary key,
    order_item_product varchar(100),
    order_item_type varchar(50),
    order_item_amount double,
    order_item_pryce double,
    order_item_total double,
    order_item_date datetime,
    id_order varchar(50) not null,
    id_bussines varchar(50) not null,
    id_cash_bussines varchar(50) not null,
    FOREIGN KEY (id_order)REFERENCES t_order(order_id),
    FOREIGN KEY (id_bussines)REFERENCES t_bussines(bussines_id),
    FOREIGN KEY (id_cash_bussines)REFERENCES t_cash_bussines(cash_bussines_id)
);
create table t_cash_driver(
    cash_driver_id varchar(50) not null primary key,
    cash_driver_correlative int,
    cash_driver_start datetime,
    cash_driver_end datetime,
    cash_driver_summary_all double DEFAULT 0.00,
    cash_driver_description varchar(50),
    id_cash_status varchar(50) not null,
    id_driver varchar(50) not null,
    FOREIGN  KEY  (id_cash_status) REFERENCES t_cash_status(cash_status_id),
    FOREIGN  KEY  (id_driver) REFERENCES t_driver(driver_id)

);
create table t_cash_people(
    cash_people_id varchar(50) not null primary key,
    cash_people_correlative int,
    cash_people_start datetime,
    cash_people_end datetime,
    cash_people_summary_all double DEFAULT 0.00,
    cash_people_description varchar(50),
    id_cash_status varchar(50) not null,
    id_people varchar(50) not null,
    FOREIGN  KEY  (id_cash_status) REFERENCES t_cash_status(cash_status_id),
    FOREIGN  KEY  (id_people) REFERENCES t_people(people_id)

);
create table t_suggestions(
    suggestion_id varchar(50) not null primary key,
    suggestion_description varchar (100),
    suggestion_status int,
    id_user varchar(50) not null,
    FOREIGN KEY (id_user)REFERENCES t_user(user_id)
);



