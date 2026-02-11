create database Traffic_Management_System_2
use Traffic_Management_System_2
go
--1
CREATE TABLE Licenses
( license_id varchar (50) primary key,
issue_date date,
expire_date date,
type varchar(50)
)

--2
CREATE TABLE Traffic_Officers(
traffic_officer_id varchar(50) primary key,
name varchar (100),
phone_no int,
rank varchar(50),
station varchar (100)
)
--3
CREATE TABLE Road
(
road_id varchar(50)primary key ,
name varchar(100),
type varchar(50),
speed_limit int,
city varchar (50)
)
--4
CREATE TABLE Officer_Assigned(
assigned_id varchar(50) primary key ,
traffic_officer_id varchar(50) foreign key references  Traffic_Officers(traffic_officer_id) ,
road_id varchar(50)foreign key references   Road(road_id ),
duty_date date,
shift varchar (50)
)
--5
CREATE TABLE Drivers
(
driver_id varchar(50) primary key ,
license_id varchar (50) foreign key references Licenses(license_id ),
name varchar(50),
age int,--age/date
address varchar (100),
phone_no int
)
--6
CREATE TABLE Vehicle(
vehicle_id varchar(50) primary key,
driver_id varchar(50) foreign key references Drivers(driver_id ),
model varchar(50),
type varchar(50),
year int
)
--7
CREATE TABLE Traffic_Signals(
signal_id varchar(50) primary key,
road_id varchar(50) foreign key references  Road (road_id),
type int,--confuse about data type
location varchar (100)
)
--8
CREATE TABLE Emergency_Services
(
service_id varchar (50) primary key,
road_id varchar(50)foreign key references  Road (road_id),
service_name varchar (50),
location varchar(50),
contact_no int
)
--9
CREATE TABLE VioLation_Types(
violation_type_id varchar (50) primary key,
type_name varchar (100),
description varchar(200),
penalty_amount int
)
--10
CREATE TABLE Violations (
violation_id varchar (50) primary key ,
vehicle_id varchar(50)foreign key references Vehicle(vehicle_id),
driver_id varchar(50)foreign key references  Drivers(driver_id),
violation_type_id varchar (50) foreign key references Violation_Types(violation_type_id),
road_id varchar(50),
date date,
Vio_time decimal(4,2),
severity varchar(50)
)
--11
CREATE TABLE Cameras(
camera_id varchar(50) primary key,
road_id varchar(50) foreign key references Road(road_id),
location varchar(50),
status varchar(50)
)
--12
CREATE TABLE Cam_Record(
evidence_id varchar(50) primary key,
violation_id varchar (50) foreign key references Violations (violation_id),
camera_id varchar(50)foreign key references Cameras(camera_id),
record_time decimal(4,2)
)
--13
CREATE TABLE Emergency_Response(
response_id varchar (50) primary key,
violation_id varchar (50) foreign key references Violations (violation_id),
service_id varchar (50) foreign key references Emergency_Services(service_id),
res_time decimal (4,2)
)

--14
CREATE TABLE Fines
(
fine_id int primary key,
violation_id varchar (50) foreign key references Violations (violation_id),
amount int,
status varchar(50)
)
--15
CREATE TABLE Officers_Record(
record_id varchar (50) primary key,
violation_id varchar (50) foreign key references Violations (violation_id),
traffic_officer_id varchar(50) foreign key references  Traffic_Officers(traffic_officer_id) ,
OR_time decimal(4,2)
)
--16
CREATE TABLE Damages
(damage_id varchar(50) primary key,
violation_id varchar (50) foreign key references Violations (violation_id),
description varchar(200),
estimated_cost int,
d_severity varchar (50)
)
--17
CREATE TABLE Maintenance_Log
(Maintenance_id varchar(50) primary key,
damage_id varchar(50)foreign key references Damages(damage_id),
cost int,
status varchar(50)
)

--DATA INSERT:

--use Traffic_Management_System

--1
INSERT INTO Licenses VALUES
('DK08382738L00005', '2018-06-12', '2028-06-12', 'H'),
('DK09283746H00043', '2021-04-05', '2026-04-05', 'M'),
('DK08391625M00078', '2017-11-20', '2027-11-20', 'L'),
('DK07234561T00024', '2020-08-15', '2025-08-15', 'C'),
('DK08356219C00056', '2022-03-10', '2027-03-10', 'T'),
('DK08473129M00089', '2019-09-01', '2029-09-01', 'P'),
('DK07382915H00033', '2020-01-25', '2025-01-25', 'HC'),
('DK08345782T00045', '2023-02-10', '2028-02-10', 'HT'),
('DK09286135C00067', '2016-12-05', '2021-12-05', 'CT'),
('DK08391574M00091', '2021-07-14', '2031-07-14', 'CP');

select * from Licenses

--2
INSERT INTO Traffic_Officers VALUES
('BP-883456-2018', 'Md. Shahin Alam', '01718345267', 'Sergeant', 'Dhaka Metropolitan Police, Motijheel Zone'),
('BP-774219-2015', 'Jahangir Kabir', '01827213489', 'Assistant Sub-Inspector (Traffic)', 'Dhaka Metropolitan Police, Gulshan Zone'),
('BP-912367-2020', 'Rakibul Hasan', '01945673829', 'Traffic Constable', 'Dhaka Metropolitan Police, Banani Zone'),
('BP-558032-2012', 'Abdul Malek', '01678423095', 'Sergeant', 'Dhaka Metropolitan Police, Mirpur Zone'),
('BP-446981-2019', 'Nazmul Huda', '01752347860', 'Traffic Constable', 'Dhaka Metropolitan Police, Dhanmondi Zone'),
('BP-229754-2016', 'Md. Shafiqul Islam', '01856329047', 'Assistant Sub-Inspector (Traffic)', 'Dhaka Metropolitan Police, Mirpur Zone'),
('BP-103842-2021', 'Tanvir Ahmed', '01998765421', 'Traffic Constable', 'Dhaka Metropolitan Police, Jatrabari Zone'),
('BP-665173-2014', 'Anwar Hossain', '01722549083', 'Sergeant', 'Dhaka Metropolitan Police, Mirpur Cantonment Zone'),
('BP-337609-2017', 'Saidur Rahman', '01889432210', 'Assistant Sub-Inspector (Traffic)', 'Dhaka Metropolitan Police, Basilla Bridge Approach Road Zone'),
('BP-490125-2013', 'Faruk Hossain', '01699234577', 'Sergeant', 'Narayanganj Metropolitan Police, Rampura Zone');

select * from Traffic_Officers


--3

INSERT INTO Road VALUES
('N105', 'Madanpur (13th Km of NJ)-Joydevpur(3rd Km of N4)', 'National Highway', '80', 'Dhaka'),
('N302', 'Tongi-Ashulia-Zerabo-EPZ Road', 'National Highway', '70', 'Gazipur'),
('N503', 'Dhaka (Mirpur)-Utholi-Paturia-Natakhola-Kashinathpur-Bogra-Rangpur-Beldanga-Banglabanah Road', 'National Highway', '100', 'Dhaka'),
('N501', 'Mirpur Bridge-Dhour Road', 'National Highway', '60', 'Dhaka'),
('N511', 'Mirpur (Birulia)-Ashulia (Yearpur) Road', 'National Highway', '60', 'Dhaka'),
('N801', 'Dhaka (Jatrabari)-Mawa-Bhanga-Barisal-Patuakhali Road', 'National Highway', '90', 'Dhaka'),
('R110', 'Jatrabari-Demra-Shimrail-Narayanganj (Chasara) Road', 'Regional Highway', '50', 'Dhaka'),
('R202', 'Bhulta-Rupganj-Kayeipara-Rampura Road', 'Regional Highway', '50', 'Narayanganj'),
('Z3002', 'Dhaka Cantonment V.V.I.P Terminal Road', 'Zila/District Road', ' 40', 'Dhaka'),
('Z8208', 'Basilla Bridge Approach Road', 'Zila/District Road', '40', 'Dhaka');

select * from Road

--4
INSERT INTO Violation_Types VALUES
('1', 'Speeding', 'Driving faster than the allowed speed limit', 3000),
('2', 'Red Light Violation', 'Not stopping when the traffic light is red', 2000),
('3', 'Illegal Parking', 'Parking in areas where it is prohibited', 1000),
('4', 'Reckless Driving', 'Operating a vehicle carelessly or dangerously', 5000),
('5', 'Seat Belt Violation', 'Failing to wear a seat belt while in the vehicle', 1000),
('6', 'Driving Without License', 'Driving without a legally valid license', 7000),
('7', 'Using Mobile While Driving', 'Handling a phone or device while driving', 2000),
('8', 'Drunk Driving', 'Operating a vehicle under alcohol or drug influence', 10000),
('9', 'Wrong Way Driving', 'Driving in the opposite direction of traffic', 3000),
('10', 'Expired Registration', 'Driving a vehicle whose registration has expired', 1500);

select * from Violation_Types


--5

INSERT INTO Drivers VALUES
('3805', 'DK08382738L00005', 'Nadeem Ahmed', '37', 'Dhanmondi, Dhaka', '01912092464'),
('3743', 'DK09283746H00043', 'Rafiqul Islam', '34', 'Mirpur-10, Dhaka', '01844763921'),
('1678', 'DK08391625M00078', 'Farzana Akter', '30', 'Uttara Sector-7, Dhaka', '01689562314'),
('5624', 'DK07234561T00024', 'Mizanur Rahman', '41', 'Mohammadpur, Dhaka', '01934672015'),
('6256', 'DK08356219C00056', 'Shamima Sultana', '27', 'Badda, Dhaka', '01788998734'),
('3189', 'DK08473129M00089', 'Nasir Uddin', '35', 'Banani, Dhaka', '01859771245'),
('2933', 'DK07382915H00033', 'Jannatul Ferdous', '31', 'Tejgaon, Dhaka', '01955223498'),
('5785', 'DK08345782T00045', 'Azhar Ali', '39', 'Motijheel, Dhaka', '01723556920'),
('6137', 'DK09286135C00067', 'Tasnia Rahman', '26', 'Rampura, Dhaka', '01864992211'),
('5791', 'DK08391574M00091', 'Shahidul Alam', '40' , 'Gulshan-2, Dhaka', '01678541209');

select * from Drivers


--6
INSERT INTO Vehicle VALUES
('VDKL00005', '3805', 'Toyota Axio', 'Car', '2018'),
('VDKH00043', '3743', 'Honda CB Hornet', 'Motorcycle', '2021'),
('VDKM00078', '1678', 'Toyota Hiace', 'Microbus', '2017'),
('VDKT00024', '5624', 'Tata Truck', 'Truck', '2020'),
('VDKC00056', '6256', 'Nissan Caravan', 'Cargo', '2022'),
('VDKM00089', '3189', 'Toyota Noah', 'Microbus', '2019'),
('VDKH00033', '2933', 'Yamaha FZ', 'Motorcycle', '2020'),
('VDKT00045', '5785', 'Hino Heavy Truck', 'Truck', '2023'),
('VDKC00067', '6137', 'Isuzu NPR', 'Covered Van', '2016'),
('VDKM00091', '5791', 'Toyota Hiace', 'Minivan', '2021'),
('VDKT00046', '5785', 'Hino Heavy Truck', 'Truck', '2021'),
('VDKC00069', '6137', 'Isuzu NPR', 'Covered Van', '2019'),
('VDKM00092', '5791', 'Toyota Hiace', 'Minivan', '2022');

select * from Vehicle


--7
INSERT INTO Officer_Assigned  VALUES
('AS-001', 'BP-883456-2018','N105', '2025-10-14', 'Morning'),
('AS-002', 'BP-774219-2015','N302', '2025-10-14', 'Night'),
('AS-003', 'BP-912367-2020','N503', '2025-10-14', 'Evening'),
('AS-004', 'BP-558032-2012','N501', '2025-10-15', 'Morning'),
('AS-005', 'BP-446981-2019','N511', '2025-10-15', 'Evening'),
('AS-006', 'BP-229754-2016','N801', '2025-10-16', 'Night'),
('AS-007', 'BP-103842-2021','R110', '2025-10-16', 'Morning'),
('AS-008', 'BP-665173-2014','R202', '2025-10-17', 'Evening'),
('AS-009', 'BP-337609-2017','Z3002', '2025-10-17', 'Night'),
('AS-010', 'BP-490125-2013','Z8208', '2025-10-18', 'Morning'),
('AS-011', 'BP-883456-2018','N105', '2025-10-16', 'Evening'),
('AS-012', 'BP-883456-2018','N302', '2025-10-17', 'Night'),
('AS-013', 'BP-912367-2020','N503', '2025-10-15', 'Morning'),
('AS-014', 'BP-558032-2012','N501', '2025-10-16', 'Evening'),
('AS-015', 'BP-446981-2019','N511', '2025-10-17', 'Morning');

select * from Officer_Assigned

--8
INSERT INTO Traffic_Signals  VALUES
('TSG-SI01', 'N105', 3, 'Shahbagh Intersection,Dhaka'),
('TSG-FG02', 'N302', 3, 'Farmgate,Dhaka'),
('TSG-NM03','N503', 4, 'New Market,Dhaka'),
('TSG-G204','N501', 3, 'Gulshan 2 Circle,Dhaka'),
('TSG-MP05','N511', 4, 'Mirpur 10 Circle,Dhaka'),
('TSG-CTG06', 'N801', 4,'GEC Circle,Chattogram'),
('TSG-DHA07','R110',3, 'Airport Road,Dhaka'),
('TSG-SY08', 'R202',3,  'Zindabazar, Sylhet'),
('TSG-KH09','Z3002',4, 'Khulna New Market,Khulna'),
('TSG-RAJ10','Z8208',4,'Rajshahi Court Point,Rajshahi'),
('TSG-SI11', 'N105', 2, 'Bijoynagar Intersection,Dhaka'),
('TSG-FG12', 'N302', 3, 'Ashulia Bypass,Dhaka'),
('TSG-NM13', 'N503', 2, 'Bogra Bypass, Bogra'),
('TSG-G2042','N501', 4, 'Mirpur 11 Circle,Dhaka'),
('TSG-MP052','N511', 3, 'Pallabi Circle,Dhaka');

select * from Traffic_Signals

--9
---same values are reapeated with just change in the id
INSERT INTO Violations VALUES
('VIO-001', 'VDKL00005','3805', '1','N105', '2025-10-08', 09.30, 'Minor'),
('VIO-002', 'VDKH00043','3743' , '2', 'N302', '2025-10-12', 14.15, 'Major'),
('VIO-003','VDKM00078','1678' , '3', 'N503', '2025-10-13', 18.45, 'Critical'),
('VIO-004', 'VDKT00024', '5624', '4', 'N501', '2025-10-14', 08.20, 'Minor'),
('VIO-005', 'VDKC00056', '6256', '5', 'N511', '2025-10-15', 12.50, 'Major'),
('VIO-006','VDKM00089','3189' , '6', 'N801', '2025-10-16', 17.30, 'Minor'),
('VIO-007','VDKH00033','2933', '7', 'R110', '2025-10-17', 07.15, 'Critical'),
('VIO-008', 'VDKT00045','5785', '8', 'R202', '2025-10-17', 16.45, 'Major'),
('VIO-009','VDKC00067','6137', '9','Z3002', '2025-10-18', 10.30, 'Minor'),
('VIO-010','VDKM00091', '5791', '10', 'Z8208', '2025-10-18', 15.20, 'Critical'),
('VIO-011', 'VDKL00005','3805', '3','N105', '2025-10-19', 11.15, 'Major'),
('VIO-012', 'VDKH00043','3743', '1','Z3002', '2025-10-19', 13.30, 'Minor'),
('VIO-013', 'VDKL00005','3805', '2','N105', '2025-10-20', 09.45, 'Minor'),
('VIO-014', 'VDKT00024','5624', '7','Z8208', '2025-10-20', 10.10, 'Major'),
('VIO-015', 'VDKC00056','6256', '8','N801', '2025-10-21', 14.50, 'Critical'),
('VIO-016', 'VDKM00089','3189', '5','N511', '2025-10-21', 16.20, 'Major'),
('VIO-017', 'VDKH00033','2933', '6','R110', '2025-10-22', 08.30, 'Minor'),
('VIO-018', 'VDKT00046','5785', '10','R202', '2025-10-22', 17.05, 'Minor'),
('VIO-019', 'VDKC00067','6137', '7','N105', '2025-10-23', 10.50, 'Critical'),
('VIO-020', 'VDKM00092','5791', '1','N501', '2025-10-23', 15.40, 'Major');

select * from  Violations

--10
INSERT INTO Cameras VALUES
('CAM-SI01', 'N105', 'Shahbagh Intersection, Dhaka', 'Active'),
('CAM-FG02', 'N302',  'Farmgate, Dhaka', 'Active'),
('CAM-NM03', 'N503',  'New Market, Dhaka', 'Inactive'),
('CAM-G204', 'N501', 'Gulshan 2 Circle, Dhaka', 'Active'),
('CAM-MP05', 'N511', 'Mirpur 10 Circle, Dhaka', 'Active'),
('CAM-CTG06', 'N801', 'GEC Circle, Chattogram', 'Active'),
('CAM-DHA07', 'R110', 'Airport Road, Dhaka', 'Under Maintenance'),
('CAM-SY08', 'R202', 'Zindabazar, Sylhet', 'Active'),
('CAM-KH09', 'Z3002',  'Khulna New Market, Khulna', 'Inactive'),
('CAM-RAJ10', 'Z8208', 'Rajshahi Court Point, Rajshahi', 'Active'),
('CAM-NM04', 'N503', 'Bogra Section, Dhaka', 'Active'),
('CAM-NM05', 'N503', 'Kashinathpur Junction, Dhaka', 'Inactive'),
('CAM-MP06', 'N511', 'Birulia Circle, Dhaka', 'Active'),
('CAM-MP07', 'N511', 'Ashulia Road, Dhaka', 'Under Maintenance'),
('CAM-CTG07', 'N801', 'Mawa Section, Dhaka', 'Active'),
('CAM-CTG08', 'N801', 'Barisal Bypass, Dhaka', 'Active'),
('CAM-DHA08', 'R110', 'Shimrail Intersection, Dhaka', 'Inactive'),
('CAM-SY09', 'R202', 'Rampura Junction, Narayanganj', 'Active'),
('CAM-KH10', 'Z3002', 'V.V.I.P Terminal, Dhaka', 'Under Maintenance'),
('CAM-RAJ11', 'Z8208', 'Bridge Approach, Rajshahi', 'Active');

select * from Cameras

--11

INSERT INTO Emergency_Services VALUES
('EMS-001', 'N105', 'Police', 'Shahbagh, Dhaka', '01713333333'),
('EMS-002', 'N302', 'Fire Service', 'Tejgaon, Dhaka', '029553555'),
('EMS-003', 'N503', 'Medical', 'Bakshibazar, Dhaka', '024711222'),
('EMS-004',  'N501', 'Police', 'Gulshan 1, Dhaka', '01711123456'),
('EMS-005', 'N511', 'Fire', 'Mirpur 10, Dhaka', '029015678'),
('EMS-006', 'N801', 'Fire', 'Agrabad, Chattogram', '031711999'),
('EMS-007', 'R110', 'Medical', 'Hazrat Shahjalal Int’l Airport, Dhaka', '01715559999'),
('EMS-008', 'R202', 'Police', 'Zindabazar, Sylhet', '0821711222'),
('EMS-009', 'Z3002', 'Fire', 'Boyra, Khulna', '041720333'),
('EMS-010',  'Z8208', 'Medical', 'Laxmipur, Rajshahi', '0721777666'),
('EMS-011', 'N503', 'Ambulance', 'Bogra, Dhaka', '024712333'),
('EMS-012', 'N503', 'Fire', 'Kashinathpur, Dhaka', '024712444'),
('EMS-013', 'N511', 'Ambulance', 'Ashulia, Dhaka', '029016111'),
('EMS-014', 'N511', 'Police', 'Birulia, Dhaka', '029016222'),
('EMS-015', 'N801', 'Medical', 'Barisal Bypass, Dhaka', '031712000'),
('EMS-016', 'N801', 'Emergency Rescue', 'Mawa, Dhaka', '031712111'),
('EMS-017', 'R110', 'Police', 'Shimrail, Dhaka', '01715600000'),
('EMS-018', 'R202', 'Ambulance', 'Rampura, Narayanganj', '0821711333'),
('EMS-019', 'Z3002', 'Fire', 'Dhaka Cantonment, Dhaka', '041721000'),
('EMS-020', 'Z8208', 'Medical', 'Basilla, Rajshahi', '0721770000');

select * from Emergency_Services

--12
INSERT INTO Emergency_Response VALUES
('RES-01','VIO-001','EMS-001', 10.30),
('RES-02','VIO-002', 'EMS-002', 14.30),
('RES-03','VIO-003','EMS-003', 18.55),
('RES-04','VIO-004','EMS-004', 09.00),
('RES-05','VIO-005','EMS-005',  13.10),
('RES-06','VIO-006', 'EMS-006',18.00),
('RES-07','VIO-007','EMS-007', 07.30),
('RES-08','VIO-008','EMS-008', 17.00),
('RES-09','VIO-009','EMS-009', 11.25),
('RES-10','VIO-010','EMS-010', 15.37),
('RES-11', 'VIO-001', 'EMS-011', 10.50),
('RES-12', 'VIO-001', 'EMS-012', 11.00),
('RES-13', 'VIO-003', 'EMS-011', 19.10),
('RES-14', 'VIO-003', 'EMS-012', 19.25),
('RES-15', 'VIO-005', 'EMS-013', 15.00),
('RES-16', 'VIO-005', 'EMS-014', 15.20),
('RES-17', 'VIO-006', 'EMS-015', 18.15),
('RES-18', 'VIO-006', 'EMS-016', 18.40),
('RES-19', 'VIO-008', 'EMS-018', 17.30),
('RES-20', 'VIO-010', 'EMS-020', 15.55);

select * from Emergency_Response
--13
INSERT INTO Damages VALUES
('DMG-001', 'VIO-001', 'Minor scratch on car bumper', 1500, 'Low'),
('DMG-002', 'VIO-002', 'Front wheel and indicator light broken', 7000, 'Medium'),
('DMG-003', 'VIO-003', 'Severe damage to front bonnet and windshield', 25000, 'High'),
('DMG-004', 'VIO-004', 'Left headlight cracked', 2000, 'Low'),
('DMG-005', 'VIO-005', 'Back door dented due to collision', 6000, 'Medium'),
('DMG-006', 'VIO-006', 'Minor side panel scratch', 1200, 'Low'),
('DMG-007', 'VIO-007', 'Vehicle overturned, heavy body damage', 35000, 'Critical'),
('DMG-008', 'VIO-008', 'Truck front grill and radiator damaged', 18000, 'High'),
('DMG-009', 'VIO-009', 'Rear bumper slightly broken', 2500, 'Low'),
('DMG-010', 'VIO-010', 'Major crash causing engine compartment damage', 40000, 'Critical'),
('DMG-011', 'VIO-001', 'Left mirror broken', 1200, 'Low'),
('DMG-012', 'VIO-001', 'Scratch on rear door', 1000, 'Low'),
('DMG-013', 'VIO-003', 'Windshield shattered', 15000, 'High'),
('DMG-014', 'VIO-003', 'Front bumper crushed', 10000, 'High'),
('DMG-015', 'VIO-005', 'Side panel dented', 3500, 'Medium'),
('DMG-016', 'VIO-011', 'Rear bumper dent', 1800, 'Low'),
('DMG-017', 'VIO-012', 'Front left indicator broken', 2200, 'Medium'),
('DMG-018', 'VIO-013', 'Minor scratch on left door', 1300, 'Low'),
('DMG-019', 'VIO-014', 'Headlight broken', 2500, 'Medium'),
('DMG-020', 'VIO-015', 'Side mirror damaged', 1500, 'Low'),
('DMG-021', 'VIO-016', 'Front bonnet dented', 5000, 'Medium'),
('DMG-022', 'VIO-017', 'Vehicle rolled, front damage', 30000, 'Critical'),
('DMG-023', 'VIO-018', 'Truck side panel crushed', 20000, 'High'),
('DMG-024', 'VIO-019', 'Rear light broken', 1800, 'Low'),
('DMG-025', 'VIO-020', 'Engine compartment damaged', 35000, 'Critical');

select * from Damages

--14
INSERT INTO Officers_Record VALUES

('OR-001', 'VIO-001', 'BP-883456-2018', 09.40),
('OR-002', 'VIO-002', 'BP-774219-2015', 14.20),
('OR-003', 'VIO-003', 'BP-912367-2020', 18.50),
('OR-004', 'VIO-004', 'BP-558032-2012', 08.23),
('OR-005', 'VIO-005', 'BP-446981-2019', 12.57),
('OR-006', 'VIO-006', 'BP-229754-2016', 17.45),
('OR-007', 'VIO-007', 'BP-103842-2021', 07.21),
('OR-008', 'VIO-008', 'BP-665173-2014', 17.00),
('OR-009', 'VIO-009', 'BP-337609-2017', 10.41),
('OR-010', 'VIO-010', 'BP-490125-2013', 15.29),
('OR-011', 'VIO-001', 'BP-558032-2012', 09.50),
('OR-012', 'VIO-002', 'BP-446981-2019', 14.40),
('OR-013', 'VIO-003', 'BP-229754-2016', 19.10),
('OR-014', 'VIO-004', 'BP-103842-2021', 08.45),
('OR-015', 'VIO-005', 'BP-665173-2014', 13.05);

select * from Officers_Record

--15
INSERT INTO Cam_Record VALUES
('EVD-001', 'VIO-001', 'CAM-SI01', 09.30),
('EVD-002', 'VIO-002', 'CAM-FG02', 14.15),  
('EVD-003', 'VIO-003', 'CAM-NM03', 18.45),  
('EVD-004', 'VIO-004', 'CAM-G204', 08.20),  
('EVD-005', 'VIO-005', 'CAM-MP05', 12.50),  
('EVD-006', 'VIO-006', 'CAM-CTG06', 17.30),  
('EVD-007', 'VIO-007', 'CAM-DHA07', 07.15),
('EVD-008', 'VIO-008', 'CAM-SY08', 16.45),
('EVD-009', 'VIO-009', 'CAM-KH09', 10.30),  
('EVD-010', 'VIO-010', 'CAM-RAJ10', 15.20),
('EVD-011', 'VIO-003', 'CAM-NM04', 18.50),
('EVD-012', 'VIO-003', 'CAM-NM05', 18.55),
('EVD-013', 'VIO-005', 'CAM-MP06', 12.55),
('EVD-014', 'VIO-005', 'CAM-MP07', 12.58),
('EVD-015', 'VIO-016', 'CAM-CTG07', 16.25),
('EVD-016', 'VIO-001', 'CAM-SI01', 09.35),
('EVD-018', 'VIO-012', 'CAM-NM05', 13.35),
('EVD-019', 'VIO-014', 'CAM-G204', 10.15),
('EVD-020', 'VIO-014', 'CAM-NM04', 10.18);
select * from Cam_Record
--16
INSERT INTO Fines VALUES
('001', 'VIO-001', 1000, 'Paid'),
('002', 'VIO-002', 3000, 'Unpaid'),
('003', 'VIO-003', 5000, 'Unpaid'),
('004', 'VIO-004', 1200, 'Paid'),
('005', 'VIO-005', 2000, 'Pending'),
('006', 'VIO-006', 800, 'Paid'),
('007', 'VIO-007', 7000, 'Unpaid'),
('008', 'VIO-008', 4000, 'Pending'),
('009', 'VIO-009', 1500, 'Paid'),
('010', 'VIO-010', 6000, 'Unpaid'),
('011', 'VIO-011', 1000, 'Paid'),
('012', 'VIO-012', 3000, 'Unpaid'),
('013', 'VIO-013', 1000, 'Pending'),
('014', 'VIO-014', 1200, 'Paid'),
('015', 'VIO-015', 2000, 'Unpaid'),
('016', 'VIO-016', 800, 'Paid'),
('017', 'VIO-017', 7000, 'Unpaid'),
('018', 'VIO-018', 4000, 'Pending'),
('019', 'VIO-019', 1500, 'Paid'),
('020', 'VIO-020', 6000, 'Unpaid');

--17
INSERT INTO Maintenance_Log VALUES
('MNT-001', 'DMG-001', 1500.00, 'Completed'),
('MNT-002', 'DMG-002', 7000.00, 'In Progress'),
('MNT-003', 'DMG-003', 25000.00, 'Pending'),
('MNT-004', 'DMG-004', 2000.00, 'Completed'),
('MNT-005', 'DMG-005', 6000.00, 'In Progress'),
('MNT-006', 'DMG-006', 1200.00, 'Completed'),
('MNT-007', 'DMG-007', 35000.00, 'Pending'),
('MNT-008', 'DMG-008', 18000.00, 'In Progress'),
('MNT-009', 'DMG-009', 2500.00, 'Completed'),
('MNT-010', 'DMG-010', 40000.00, 'Pending'),
('MNT-011', 'DMG-005', 3500.00, 'Pending'),
('MNT-012', 'DMG-006', 1200.00, 'Completed'),
('MNT-013', 'DMG-007', 35000.00, 'Pending'),
('MNT-014', 'DMG-007', 10000.00, 'In Progress'),
('MNT-015', 'DMG-008', 18000.00, 'In Progress'),
('MNT-016', 'DMG-008', 5000.00, 'Pending'),
('MNT-017', 'DMG-009', 2500.00, 'Completed'),
('MNT-018', 'DMG-010', 40000.00, 'Pending'),
('MNT-019', 'DMG-011', 1200.00, 'Completed'),
('MNT-020', 'DMG-012', 1000.00, 'Pending'),
('MNT-021', 'DMG-013', 15000.00, 'In Progress'),
('MNT-022', 'DMG-014', 10000.00, 'Completed'),
('MNT-023', 'DMG-015', 3500.00, 'In Progress'),
('MNT-024', 'DMG-016', 1800.00, 'Completed'),
('MNT-025', 'DMG-017', 2200.00, 'In Progress'),
('MNT-026', 'DMG-018', 1300.00, 'Pending'),
('MNT-027', 'DMG-019', 1800.00, 'Completed'),
('MNT-028', 'DMG-020', 35000.00, 'Pending'),
('MNT-029', 'DMG-021', 5000.00, 'Completed'),
('MNT-030', 'DMG-022', 30000.00, 'Pending'),
('MNT-031', 'DMG-023', 20000.00, 'In Progress'),
('MNT-032', 'DMG-024', 1800.00, 'Completed'),
('MNT-033', 'DMG-025', 35000.00, 'Pending');


--Query
--1
select *from Drivers
--2
select vehicle_id, type, model
from Vehicle
--3
select fine_id, violation_id, amount, status
from Fines
where status = 'unpaid'

--4
select name, vehicle_id, type
from Drivers as d, Vehicle as v
where d.driver_id = v.driver_id
--5
select v.violation_id,u.type_name, f.amount, f.status
from Violations as v, Violation_Types as u, Fines as f
where v.violation_type_id = u.violation_type_id and v.violation_id = f.violation_id and f.status='paid'
--6
select r.record_id, r.violation_id, t. traffic_officer_id, t.name, r.OR_time
from Officers_Record as r,[dbo].[Traffic_Officers] as t
where t.traffic_officer_id = r.traffic_officer_id
--7
select v.violation_id, r.road_id,r.name,r.city
from [dbo].[Violations] as v, Road as r
where v.road_id= r.road_id and r.city= 'Gazipur'
--8
select v.violation_id, r.name
from [dbo].[Violations] as v, [dbo].[Road] as r
where v.road_id= r.road_id

--9
select  d.name, l.license_id, len(l.type) as vehicle_number
from Licenses as l, Drivers as d
where d.license_id= l.license_id
--10
select *
from [dbo].[Road]
where road_id LIKE 'N%'

--11
select *
from Fines
where status='Pending'
Order by amount

--12
select *
from Drivers
where age>30 and age<40
Order by age desc

--13
--data change korte hobe
select  *
from Emergency_Services
where road_id ='N501' and service_name='Police'

--14
select violation_id
from [dbo].[Officers_Record]
union
select violation_id from fines where status='Paid'

--15
select violation_id
from [dbo].[Officers_Record]
intersect  
select violation_id from fines where amount>5000

--16

select violation_id
from [dbo].[Officers_Record]
except
select violation_id from fines  where status ='Paid'

--aggregate
--17
select traffic_officer_id ,count (*) as Total_Violation
from [dbo].[Officers_Record]
group by traffic_officer_id

--18
select min( estimated_cost) as Min_Damage
from [dbo].[Damages]

--19
select sum(amount) as Total_paid
from [dbo].[Fines] where status='Paid'

--20
select e.service_name , count(r.response_id) as total_res
from [dbo].[Emergency_Services]as e, [dbo].[Emergency_Response] as r
where e.service_id = r. service_id
group by e.service_name
Order by total_res desc

--21
select max(penalty_amount) as max_penalty
from VioLation_Types

--22
select avg(cost) as avg_maintenance_cost
from Maintenance_Log

--23
select violation_id, avg(amount) as avg_fine
from Fines
group by violation_id
having avg(amount)>2000

--24
select name
from Traffic_Officers
where traffic_officer_id in (select traffic_officer_id
from Officers_Record
where violation_id in(select violation_id
from Violations
where severity='Critical'))

--25
select name, road_id
from Road
where road_id in (select road_id
from Cameras
where status='Active')

--26
-----update queries-----
UPDATE Cameras
set status = 'Active'
where camera_id = 'CAM-NM03'

select * from Cameras

---27
UPDATE VioLation_Types
set penalty_amount= case
when penalty_amount<=5000 then penalty_amount*1.1
else penalty_amount*1.05
end

select * from VioLation_Types


----28-----
----Delete----
DELETE from Maintenance_Log
where status='Completed'

select * from Maintenance_Log


-----29----
DELETE from Cam_Record
where violation_id in (select violation_id
from Violations
where severity='Minor')

select * from Cam_Record




select * from Fines
drop table Fines

--INsertion trigger
CREATE TRIGGER trigg_violation_fines
ON [dbo].[Violations]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert a new fine for each new violation
    INSERT INTO [dbo].[Fines](fine_id, violation_id, amount, status)
    SELECT
        (SELECT ISNULL(MAX(fine_id), 0) from [dbo].[Fines]) + ROW_NUMBER() OVER (ORDER BY i.violation_id),
        i.violation_id,
        (SELECT vt.penalty_amount
         FROM [dbo].[VioLation_Types] as vt
         WHERE vt.violation_type_id = i.violation_type_id),
        'Unpaid'
    FROM inserted i;
END;
GO

insert into Violations values
('VIO-022', 'VDKM00092','5791', '10','Z8208', '2025-10-24', 2.40, 'Major')


SELECT * FROM Violations

update Violations
set violation_type_id= '9'
where violation_id = 'VIO-022'



select* from Fines
select * from [dbo].[Fines_Delete_Log]

-- Update trigger for Violations
CREATE TRIGGER trigg_violation_fines_update
ON [dbo].[Violations]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the fine amount if violation_type_id has changed
    UPDATE [dbo].[Fines]
    SET
        amount = (SELECT vt.penalty_amount
                  FROM [dbo].[VioLation_Types] vt
                  WHERE vt.violation_type_id = i.violation_type_id),
        status = 'Unpaid'
    FROM [dbo].[Fines] as f, inserted as i, deleted as d
    WHERE f.violation_id = i.violation_id
      AND i.violation_type_id <> d.violation_type_id;  -- only if type actually changed
END;



--
CREATE TABLE Fines_Delete_Log (
    fine_id int,
    violation_id Varchar(50),
    amount int,
    status varchar (50),
    deleted_at DATE,
PRIMARY KEY (fine_id, deleted_at)
);

CREATE TRIGGER trigg_Fines_Delete
ON [dbo].[Fines]
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert deleted records into log table with timestamp
    INSERT INTO [dbo].[Fines_Delete_Log] (fine_id, violation_id, amount, status, deleted_at)
    SELECT
        d.fine_id,
        d.violation_id,
        d.amount,
        d.status,
        CAST(GETDATE() AS DATE) -- capture deletion time
    FROM deleted d;
END;
GO



delete from [dbo].[Fines]
where fine_id=21;

SELECT * FROM [dbo].[Fines_Delete_Log]

----------view operation------
--shows driver with pending fines
---join use korbo na
CREATE VIEW vw_DriversPendingFines AS
SELECT
    d.driver_id,
    d.name AS driver_name,
    d.license_id,
    v.violation_id,
    vt.type_name,
v.date AS violation_date,
    f.amount AS fine_amount,
    f.status AS fine_status
FROM Drivers d
JOIN Violations v ON v.driver_id = d.driver_id
JOIN Violation_Types vt ON vt.violation_type_id = v.violation_type_id
JOIN Fines f ON f.violation_id = v.violation_id
WHERE f.status IN ('Unpaid', 'Pending');
------eituku------

---without join operation-----
CREATE VIEW vw_DriverrUnpaidFines AS
SELECT
    d.driver_id,
    d.name AS driver_name,
    d.license_id,
    v.violation_id,
    vt.type_name,
v.date AS violation_date,
    f.amount AS fine_amount,
    f.status AS fine_status

from Drivers as d, Violations as v, VioLation_Types as vt, Fines as f
where v.driver_id = d.driver_id and vt.violation_type_id = v.violation_type_id and f.violation_id = v.violation_id and
f.status = 'Unpaid';


select * from vw_DriverrUnpaidFines
order by driver_id



-------2nd view------
----most frequent violation-----
CREATE VIEW vw_Most_FrequentViolations AS
SELECT
    vt.type_name,
    COUNT(v.violation_id) AS violation_count
FROM Violation_Types as vt, Violations as v
where v.violation_type_id = vt.violation_type_id
GROUP BY vt.type_name

select * from vw_Most_FrequentViolations


------3rd view------
-----officers violation count------
CREATE VIEW vw_OfficerHandledViolationCount AS
SELECT
    t.traffic_officer_id,
    t.name AS officer_name,
t.rank as officer_rank,
t.phone_no as officer_phone_no,
    COUNT(v.violation_id) AS total_violations_reported
FROM Traffic_Officers as t, Officers_Record as r, Violations as v
where t.traffic_officer_id=r.traffic_officer_id and r.violation_id = v.violation_id
GROUP BY t.traffic_officer_id, t.name, t.rank, t.phone_no

--drop view vw_OfficerViolationCount

select * from vw_OfficerHandledViolationCount
