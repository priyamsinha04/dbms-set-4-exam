-- Creating the Vehicle_details table
CREATE TABLE Vehicle_details (
 Vehicle_id NUMBER(3) PRIMARY KEY,
 Vehicle_name VARCHAR2(15) NOT NULL,
 Company_name VARCHAR2(15),
 Manufacturing_country VARCHAR2(15)
);
-- Creating the Driver_details table
CREATE TABLE Driver_details (
 Driver_id CHAR(4) PRIMARY KEY,
 Driver_name VARCHAR2(25) NOT NULL,
 Driver_dob DATE,
 Driver_doj DATE,
 Driver_grade CHAR(1) CHECK (Driver_grade IN ('A', 'B', 'C', 'D', 'E')),
 Driver_distance NUMBER(5),
 Vehicle_number NUMBER(3),
 FOREIGN KEY (Vehicle_number) REFERENCES 
Vehicle_details(Vehicle_id)
);
-- Inserting dummy values into the Vehicle_details table
INSERT INTO Vehicle_details (Vehicle_id, Vehicle_name, Company_name, 
Manufacturing_country) VALUES
(101, 'Car', 'Company1', 'Country1');
INSERT INTO Vehicle_details (Vehicle_id, Vehicle_name, Company_name, 
Manufacturing_country) VALUES
(102, 'Truck', 'Company2', 'Country2');
INSERT INTO Vehicle_details (Vehicle_id, Vehicle_name, Company_name, 
Manufacturing_country) VALUES
(103, 'Bike', 'Company3', 'Country3');
-- Inserting dummy values into the Driver_details table
INSERT INTO Driver_details (Driver_id, Driver_name, Driver_dob, 
Driver_doj, Driver_grade, Driver_distance, Vehicle_number) VALUES
('D101', 'John Doe', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 
TO_DATE('2015-03-20', 'YYYY-MM-DD'), 'A', 6000, 101);
INSERT INTO Driver_details (Driver_id, Driver_name, Driver_dob, 
Driver_doj, Driver_grade, Driver_distance, Vehicle_number) VALUES
('D102', 'Jane Smith', TO_DATE('1985-08-25', 'YYYY-MM-DD'), 
TO_DATE('2016-01-10', 'YYYY-MM-DD'), 'B', 9000, 102);
INSERT INTO Driver_details (Driver_id, Driver_name, Driver_dob, 
Driver_doj, Driver_grade, Driver_distance, Vehicle_number) VALUES
('D103', 'Mike Johnson', TO_DATE('1992-11-30', 'YYYY-MM-DD'), 
TO_DATE('2017-06-05', 'YYYY-MM-DD'), 'C', 10000, 103);

Describe Driver_details
Describe Vehicle_details
    
Select * from Driver_details ;
Select * from Vehicle_details;

Select dd.Driver_id, dd.Driver_name,dd.Driver_dob,dd.Driver_doj,dd.Driver_grade,dd.Driver_distance, vd.Vehicle_name
    FROM Driver_details dd
    JOIN Vehicle_details vd ON dd.Vehicle_number=vd.Vehicle_id
    Where vd.Vehicle_name='Truck';

SELECT Driver_name
FROM Driver_details
WHERE Driver_distance > 8000;

SELECT COUNT(*)
FROM Driver_details
WHERE Driver_distance > 7000;
