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
create table t_producto(
    product_id int not null primary key AUTO_INCREMENT ,
    product_name varchar(50),
    product_price double,
    pruduct_image varchar(100),
    product_description text,
    product_
);
/**/