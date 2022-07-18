create database if not exists ymall
default character set utf8 collate utf8_general_ci;

use ymall;

CREATE TABLE IF NOT EXISTS member(
    id VARCHAR(128) PRIMARY KEY, -- "email"
    password VARCHAR(32),
    name VARCHAR(32),
    email varchar(1024)
);

CREATE TABLE IF NOT EXISTS product(
    no INT UNSIGNED PRIMARY KEY,
    category VARCHAR(128),
    name varchar(1024),
    content VARCHAR(4096),
    price varchar(1024),
    quentity varchar(1024),
    images VARCHAR(1024)
);

CREATE TABLE IF NOT EXISTS product(
    orderId varchar(128) primary key,
	product varchar(1024),
	images varchar(1024)
);
