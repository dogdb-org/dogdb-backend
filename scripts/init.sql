CREATE SCHEMA IF NOT EXISTS dogpedia;
SET search_path TO dogpedia,public;

CREATE TABLE dog_breed (
    id varchar(150) PRIMARY KEY,
    short_description varchar(150),
    long_description varchar(1024),
    image_path varchar(255)
);


INSERT INTO dog_breed (id, short_description, long_description, image_path)
values ('German Shephard', 'This is a smart puppy.', 'This is a really, really smart puppy.', '/images/german-shephard.jpg');
INSERT INTO dog_breed (id, short_description, long_description, image_path)
values ('Chihuahua', 'All shake and anger.', 'A dog that is all shake and anger and generally unhappy.', '/images/chihuahua.jpg');
