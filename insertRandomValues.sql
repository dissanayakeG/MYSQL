use order_management_system;

set @i = 0;
INSERT INTO customers (first_name, last_name, phone, email, address1, address2,country_id,state_id,postal_id)
VALUES 
(
concat('cus_fn_',@i:=@i+1), --This concatenates the string 'cus_fn_' with the value of @i, and then increments @i by 1. 
concat('cus_fn_',@i:=@i+1), 
'+011111111', 
concat('cus_fn_',@i:=@i+1,'@gmail.com'), 
concat('add1_',@i:=@i+1),
concat('add2_',@i:=@i+1), 
FLOOR(RAND()*(5-1+1))+1, --This generates a random number between 1 and 5, inclusive.
FLOOR(RAND()*25-1+1)+1, 
FLOOR(RAND()*(50-1+1))+1
);

-- Note: This script relies on the @i variable for generating unique values. Each time you run this script, 
-- @i will continue from where it left off. If you run this script multiple times, you might get duplicate data unless you reset @i to 0.
