CREATE TABLE Patient(

Patient_ID INT NOT NULL,
Patient_Name VARCHAR(100),
Patient_Age INT,
Patient_Address VARCHAR(100),
Patient_Gender VARCHAR(100),
Disease VARCHAR(100)

);

ALTER TABLE Patient
Add Doctor_ID INT NOT NULL

ALTER TABLE Patient
DROP COLUMN Patient_Gender

ALTER TABLE Patient
ADD CONSTRAINT Patient_PK 
PRIMARY KEY (Patient_ID)

CREATE TABLE Doctor(

Doctor_ID INT NOT NULL,
Doctor_Name VARCHAR(100),
Doctor_Age VARCHAR(100),
Doctor_Gender VARCHAR(100),
Doctor_Address VARCHAR(100)

CONSTRAINT Doctor_PK Primary Key(Doctor_ID)
);

CREATE TABLE Room(

Room_no VARCHAR(50) NOT NULL,
Room_type VARCHAR(100),
Room_status VARCHAR(100),

CONSTRAINT Room_PK PRIMARY KEY (Room_no)

);

ALTER TABLE Patient
ADD CONSTRAINT Patient_Doc_FK
FOREIGN KEY(Doctor_ID) REFERENCES Doctor(Doctor_ID)

CREATE TABLE Check_IN_OUT(

Patient_ID INT NOT NULL,
Room_no VARCHAR(50),
join_date DATETIME,
Leave_date DATETIME

CONSTRAINT Room_IN_FK_FK
FOREIGN KEY (Room_no) REFERENCES Room (Room_no)
)

INSERT INTO Doctor
values(1, 'Kayen', 35, 'male', 'California'),
(2, 'mark', 34, 'male', 'California'),
(3, 'diana', 40, 'female', 'California'),
(4, 'emy', 45, 'female', 'California'),
(5, 'david', 30, 'male', 'California');

INSERT INTO Patient
VALUES( 1, 'Harry', 20, 'California', 'flu', 3),
( 2, 'jack', 30, 'California', 'COVID19', 2),
( 3, 'William', 25, 'California', 'Virus C', 5),
( 4, 'joe', 25, 'California', 'heart disease', 4);

INSERT INTO Room
VALUES(1, 'premium', 'empty'),
(2, 'suite', 'reserved'),
(3, 'sharing room', 'empty'),
(4, 'premium', 'reserved'),
(5, 'day care', 'reserved'),
(6, 'premium', 'empty');

INSERT INTO Check_IN_OUT
VALUES(1, 2, '2020 - 1 - 20', ''),
(2, 1, '2020 - 1 - 10', '2020 - 1 - 15'),
(3, 4, '2020 - 1 - 20', ''),
(4, 6, '2020 - 1 - 8', '2020 - 1 - 20');

UPDATE Check_IN_OUT
SET Leave_date = NULL
WHERE Patient_ID = 1 or Patient_ID = 3;

DELETE FROM Doctor
WHERE Doctor_ID = 6;

SELECT * FROM Doctor

SELECT * FROM Doctor WHERE Doctor_Age = 35

SELECT Doctor_Name FROM Doctor

SELECT Doctor_Name FROM Doctor
WHERE Doctor_Age = 40

SELECT Patient_Name,Disease, Doctor_Name
FROM Patient, Doctor
WHERE Patient.Patient_ID = Doctor.Doctor_ID

SELECT Patient.Patient_Name, Patient.Disease, Room.Room_no, Room.Room_Status, Check_IN_OUT.join_date, Check_IN_OUT.Leave_date
FROM Patient, Check_IN_OUT, Room
WHERE Patient.Patient_ID = Check_IN_OUT.Patient_ID AND Check_IN_OUT.Room_no = Room.Room_no AND Check_IN_OUT.Leave_date != ''

SELECT Patient.Patient_Name, Patient.Patient_ID, Doctor.Doctor_Name, Patient.Disease, Doctor.Doctor_Age
FROM Patient, Doctor
WHERE Patient.Doctor_ID = Doctor.Doctor_ID AND Doctor.Doctor_Age < 45

SELECT Patient.Patient_ID, Patient.Patient_Name, Patient.Disease, Check_IN_OUT.join_date, Check_IN_OUT.Leave_date, Room.Room_no, Room.Room_status
FROM Patient, Room, Check_IN_OUT
WHERE Patient.Patient_ID = Check_IN_OUT.Patient_ID AND Check_IN_OUT.Room_no = Room.Room_no
ORDER BY Patient.Patient_ID DESC