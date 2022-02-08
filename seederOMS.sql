use order_management_system;

INSERT INTO countries (name)
VALUES ('Austrailia'),('New Zealand'),('USA'),('UK'),('France');

INSERT INTO states (country_id, name)
VALUES 
('1', 'New South Wales'),('1', 'Queensland'),('1', 'South Australia'),('1', 'Tasmania'),('1', 'Victoria'),
('2', 'Northland'),('2', 'Auckland'),('2', 'Waikato'),('2', 'Gisborne'),('2', 'Wellington'),
('3', 'Alabama'),('3', 'Alaska'),('3', 'Arizona'),('3', 'Georgia'),('3', 'New Mexico'),
('4', 'London'),('4', 'North East'),('4', 'North West'),('4', 'Yorkshire'),('4', 'East Midlands'),
('5', 'Auvergne'),('5', 'Burgundy'),('5', 'Brittany'),('5', 'Alsace'),('5', 'Mayotte')
;

INSERT INTO postal_codes (country_id,state_id, name)
VALUES 
('1','1','NSW1'),
('1','1','NSW2'),
('1','2','QSL1'),
('1','2','QSL2'),
('1','3','SA1'),
('1','3','SA2'),
('1','4','TS1'),
('1','4','TS2'),
('1','5','VIC1'),
('1','5','VIC2'),

('2','6','NRL1'),
('2','6','NRL2'),
('2','7','AUC1'),
('2','7','AUC2'),
('2','8','WA1'),
('2','8','WSA2'),
('2','9','GIS1'),
('2','9','GIS2'),
('2','10','WEL1'),
('2','10','WEL2'),

('3','11','ALB1'),
('3','11','ALB2'),
('3','12','ALS1'),
('3','12','ALS2'),
('3','13','ARI1'),
('3','13','ARI2'),
('3','14','GEO1'),
('3','14','GEO2'),
('3','15','NM1'),
('3','15','NM2'),

('4','16','LON1'),
('4','16','LON2'),
('4','17','NE1'),
('4','17','NE2'),
('4','18','NW1'),
('4','18','NW2'),
('4','19','YOR1'),
('4','19','YOR2'),
('4','20','EM1'),
('4','20','EM2'),

('5','21','AU1'),
('5','21','AU2'),
('5','22','BUR1'),
('5','22','BUR2'),
('5','23','BRI1'),
('5','23','BRI2'),
('5','24','ALS1'),
('5','24','ALS2'),
('5','25','MAY1'),
('5','25','MAY2');

set @i = 0;
INSERT INTO customers (first_name, last_name, phone, email, address1, address2,country_id,state_id,postal_id)
VALUES 
(
concat('cus_fn_',@i:=@i+1),
concat('cus_fn_',@i:=@i+1), 
'+011111111', 
concat('cus_fn_',@i:=@i+1,'@gmail.com'), 
concat('add1_',@i:=@i+1),
concat('add2_',@i:=@i+1), 
FLOOR(RAND()*(5-1+1))+1,
FLOOR(RAND()*25-1+1)+1, 
FLOOR(RAND()*(50-1+1))+1
);

INSERT INTO categories (category_name)
VALUES ('Electric'),('Furniture'),('Paper'),('Clothes'),('Beauty');

INSERT INTO products (product_name, category_id)
VALUES 
('Phone',1),('TV',1),('Laptop',1),('Desktop',1),('Fan',1),
('Table',2),('Tabel lamp',2),('Stool',2),('Sofa',2),('Cupbourd',2),
('Harry potter 1',3),('Harry potter 2',3),('Harry potter 3',3),('Harry potter 4',3),('Harry potter 5',3),
('Denim',4),('Short',4),('Shirt',4),('Frock',4),('Cap',4),
('Cream 1',5),('Cream 2',5),('Cream 3',5),('Cream 4',5),('Cream 5',5);


DROP PROCEDURE IF EXISTS insertRowsTocustomers;
DELIMITER //  
CREATE PROCEDURE insertRowsTocustomers()   
BEGIN
DECLARE i INT DEFAULT 2; 
WHILE (i <= 150) DO
INSERT INTO customers (first_name, last_name, phone, email, address1, address2,country_id,state_id,postal_id)
VALUES (
    concat('cus_fn_',i),
    concat('cus_fn_',i), 
    '+011111111', 
    concat('cus_fn_',i,'@gmail.com'), 
    concat('add1_',i), 
    concat('add2_',i),
    FLOOR(RAND()*(5-1+1))+1,
    FLOOR(RAND()*25-1+1)+1, 
    FLOOR(RAND()*(50-1+1))+1
    );
    SET i = i+1;
END WHILE;
END;
//  
DELIMITER ;

CALL insertRowsTocustomers();
SELECT * FROM customers;

























