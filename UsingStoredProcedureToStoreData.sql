drop database sqlPracticals;
create database sqlPracticals;
use sqlPracticals;

CREATE TABLE student_data (
id INT AUTO_INCREMENT,
enroll_id INT,
term VARCHAR(50),
specialization VARCHAR(50),
PRIMARY KEY (id)
);

SELECT * FROM student_data;

DROP PROCEDURE IF EXISTS insertRowsTostudent_data;
DELIMITER //  
CREATE PROCEDURE insertRowsTostudent_data()   
BEGIN
DECLARE i INT DEFAULT 1; 
WHILE (i <= 15) DO
    INSERT INTO student_data ( enroll_id,term,specialization) VALUES (i,"term1", "Computers");
    SET i = i+1;
END WHILE;
END;
//  
DELIMITER ;

CALL insertRowsTostudent_data();
SELECT * FROM student_data;