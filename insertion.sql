CREATE DATABASE IF NOT EXISTS hotel_chain;
USE hotel_chain;


-- Inserting data for HotelChain

INSERT INTO HotelChain(Chain_ID, Street_Name,Street_Numb,Apt_Numb,City,Province,Zip_Code,Chain_Name,NumbOfHotels,Email,TelNo)
VALUES
(1,'Main Street', 100, NULL, 'New York', 'NY', '10001', 'ROSE Hotels', 8, 'rosehotels@example.com', '123-456-7890'),
(2, 'Broadway', 500, NULL, 'Los Angeles', 'CA', '90001', 'JASMINE Hotels', 8, 'jasminehotels@example.com', '987-654-3210'),
(3, 'Market Street', 300, NULL, 'Chicago', 'IL', '60601', 'TULIP Hotels', 8, 'tuliphotels@example.com', '555-123-4567'),
(4, 'Oak Avenue', 700, NULL, 'Houston', 'TX', '77002', 'IRIS Hotels', 8, 'irishotels@example.com', '222-333-4444'),
(5, 'Ocean Boulevard', 800, NULL, 'Miami', 'FL', '33101', 'ORCHID Hotels', 8, 'orchidhotels@example.com', '999-888-7777');

-- Inserting data for ROSE Hotels (Chain_ID = 1)
INSERT INTO Hotel(Hotel_ID, Street_Name, Street_Numb, Apt_Numb, City, Province, Zip_Code, Email, TelNo, StarRating, NumbOfRooms, Manager_ID, Chain_ID)
VALUES
(1, 'Rose Street', 10, NULL, 'New York', 'NY', '10005', 'rose1@example.com', '123-456-7890', 5, 50, 1, 1),
(2, 'Root Street', 20, NULL, 'New York', 'NY', '10005', 'rose2@example.com', '123-456-7891', 3, 60, 2, 1),
(3, 'Locus Street', 30, NULL, 'New York', 'NY', '10005', 'rose3@example.com', '123-456-7892', 4, 70, 3, 1),
(4, 'Freedom Street', 40, NULL, 'New York', 'NY', '10005', 'rose4@example.com', '123-456-7893', 3, 80, 4, 1),
(5, 'Olive Street', 50, NULL, 'New York', 'NY', '10005', 'rose5@example.com', '123-456-7894', 4, 90, 5, 1),
(6, 'Gard Avenue', 100, NULL, 'New York', 'NY', '10010', 'rose6@example.com', '123-456-7895', 5, 70, 6, 1),
(7, 'Garden Avenue', 200, NULL, 'New York', 'NY', '10010', 'rose7@example.com', '123-456-7896', 4, 80, 7, 1),
(8, 'Floor Avenue', 300, NULL, 'New York', 'NY', '10010', 'rose8@example.com', '123-456-7897', 3, 90, 8, 1);

-- Hotels for JASMINE Hotels (Chain ID: 2)
INSERT INTO Hotel (Hotel_ID, Street_Name, Street_Numb, Apt_Numb, City, Province, Zip_Code, Email, TelNo, StarRating, NumbOfRooms, Manager_ID, Chain_ID)
VALUES
(9, 'Jasmine Street', 10, NULL, 'Los Angeles', 'CA', '90001', 'jasmine1@example.com', '111-222-3334', 3, 50, 401, 2),
(10, 'Blossom Avenue', 20, NULL, 'Los Angeles', 'CA', '90001', 'jasmine2@example.com', '111-222-3335', 4, 60, 402, 2),
(11, 'Petals Road', 30, NULL, 'Los Angeles', 'CA', '90001', 'jasmine3@example.com', '111-222-3336', 3, 70, 403, 2),
(12, 'Rosebud Lane', 40, NULL, 'Los Angeles', 'CA', '90001', 'jasmine4@example.com', '111-222-3337', 4, 80, 404, 2),
(13, 'Lilac Street', 50, NULL, 'Los Angeles', 'CA', '90001', 'jasmine5@example.com', '111-222-3338', 4, 90, 405, 2),
(14, 'Meadow Avenue', 60, NULL, 'Los Angeles', 'CA', '90001', 'jasmine6@example.com', '111-222-3339', 5, 70, 406, 2),
(15, 'Sunset Boulevard', 70, NULL, 'Los Angeles', 'CA', '90001', 'jasmine7@example.com', '111-222-3340', 5, 80, 407, 2),
(16, 'Garden Lane', 80, NULL, 'Los Angeles', 'CA', '90001', 'jasmine8@example.com', '111-222-3341', 3, 90, 408, 2);

-- Hotels for TULIP Hotels (Chain ID: 3)
INSERT INTO Hotel (Hotel_ID, Street_Name, Street_Numb, Apt_Numb, City, Province, Zip_Code, Email, TelNo, StarRating, NumbOfRooms, Manager_ID, Chain_ID)
VALUES
(17, 'Tulip Street', 10, NULL, 'Chicago', 'IL', '60601', 'tulip1@example.com', '555-123-4568', 3, 50, 101, 3),
(18, 'Petal Avenue', 20, NULL, 'Chicago', 'IL', '60601', 'tulip2@example.com', '555-123-4569', 5, 60, 102, 3),
(19, 'Bloom Lane', 30, NULL, 'Chicago', 'IL', '60601', 'tulip3@example.com', '555-123-4570', 5, 70, 103, 3),
(20, 'Rosebud Street', 40, NULL, 'Chicago', 'IL', '60601', 'tulip4@example.com', '555-123-4571', 5, 80, 104, 3),
(21, 'Daisy Road', 50, NULL, 'Chicago', 'IL', '60601', 'tulip5@example.com', '555-123-4572', 4, 90, 105, 3),
(22, 'Floral Avenue', 60, NULL, 'Chicago', 'IL', '60601', 'tulip6@example.com', '555-123-4573', 4, 70, 106, 3),
(23, 'Meadow Lane', 70, NULL, 'Chicago', 'IL', '60601', 'tulip7@example.com', '555-123-4574', 4, 80, 107, 3),
(24, 'Tulip Blossom Drive', 80, NULL, 'Chicago', 'IL', '60601', 'tulip8@example.com', '555-123-4575', 3, 90, 108, 3);

-- Hotels for IRIS Hotels (Chain ID: 4)
INSERT INTO Hotel (Hotel_ID, Street_Name, Street_Numb, Apt_Numb, City, Province, Zip_Code, Email, TelNo, StarRating, NumbOfRooms, Manager_ID, Chain_ID)
VALUES
(25, 'Iris Street', 10, NULL, 'Houston', 'TX', '77001', 'iris1@example.com', '222-333-4445', 3, 50, 201, 4),
(26, 'Flower Avenue', 20, NULL, 'Houston', 'TX', '77001', 'iris2@example.com', '222-333-4446', 4, 60, 202, 4),
(27, 'Garden Road', 30, NULL, 'Houston', 'TX', '77001', 'iris3@example.com', '222-333-4447', 5, 70, 203, 4),
(28, 'Petunia Lane', 40, NULL, 'Houston', 'TX', '77001', 'iris4@example.com', '222-333-4448', 5, 80, 204, 4),
(29, 'Lily Street', 50, NULL, 'Houston', 'TX', '77001', 'iris5@example.com', '222-333-4449', 4, 90, 205, 4),
(30, 'Violet Lane', 60, NULL, 'Houston', 'TX', '77001', 'iris6@example.com', '222-333-4450', 3, 70, 206, 4),
(31, 'Daffodil Avenue', 70, NULL, 'Houston', 'TX', '77001', 'iris7@example.com', '222-333-4451', 4, 80, 207, 4),
(32, 'Bluebell Street', 80, NULL, 'Houston', 'TX', '77001', 'iris8@example.com', '222-333-4452', 5, 90, 208, 4);

-- Hotels for ORCHID Hotels (Chain ID: 5)
INSERT INTO Hotel (Hotel_ID, Street_Name, Street_Numb, Apt_Numb, City, Province, Zip_Code, Email, TelNo, StarRating, NumbOfRooms, Manager_ID, Chain_ID)
VALUES
(33, 'Orchid Street', 10, NULL, 'Miami', 'FL', '33101', 'orchid1@example.com', '999-888-7778', 3, 50, 301, 5),
(34, 'Floral Boulevard', 20, NULL, 'Miami', 'FL', '33101', 'orchid2@example.com', '999-888-7779', 4, 60, 302, 5),
(35, 'Blossom Drive', 30, NULL, 'Miami', 'FL', '33101', 'orchid3@example.com', '999-888-7780', 5, 70, 303, 5),
(36, 'Rose Lane', 40, NULL, 'Miami', 'FL', '33101', 'orchid4@example.com', '999-888-7781', 5, 80, 304, 5),
(37, 'Lily Avenue', 50, NULL, 'Miami', 'FL', '33101', 'orchid5@example.com', '999-888-7782', 4, 90, 305, 5),
(38, 'Petal Street', 60, NULL, 'Miami', 'FL', '33101', 'orchid6@example.com', '999-888-7783', 4, 70, 306, 5),
(39, 'Tropical Road', 70, NULL, 'Miami', 'FL', '33101', 'orchid7@example.com', '999-888-7784', 3, 80, 307, 5),
(40, 'Bloom Avenue', 80, NULL, 'Miami', 'FL', '33101', 'orchid8@example.com', '999-888-7785', 3, 90, 308, 5);


-- Rooms for ROSE Hotels
INSERT INTO Room(Room_ID, Rtype, Price, Capacity, Room_view, Extendable, Issues, Hotel_ID)
VALUES
 -- Hotel 1
(1, 'Single', 100, 1, 'ocean View', true, NULL, 1),
(2, 'Double', 150, 2, 'montain View', false, NULL, 1),
(3, 'King', 250, 2, 'ocean View', false, NULL, 1),
(4, 'Single',100, 1, 'montain View', true, NULL,1),
(5, 'Double', 150, 2, 'montain View', true, NULL, 1),
 -- Hotel 2
(6, 'Single', 100, 1, 'ocean View', true, NULL, 2),
(7, 'Double', 150, 2, 'montain View', true, NULL, 2),
(8, 'Twin', 135, 2, 'ocean View', false, NULL, 2),
(9, 'Queen', 175, 2, 'montain View', false, NULL, 2),
(10, 'Single', 100, 1, 'ocean View', true, NULL, 2),
 -- Hotel 3
(11, 'Double', 150, 2, 'montain View', false, NULL, 3),
(12, 'King', 250, 2, 'ocean View', true, NULL, 3),
(13, 'Single',100, 1, 'montain View', true, NULL, 3),
(14, 'Double', 150, 2, 'montain View', true, NULL, 3),
(15, 'Single', 100, 1, 'ocean View', false, NULL, 3),
 -- Hotel 4
(16, 'Double', 150, 2, 'montain View', false, NULL, 4),
(17, 'Twin', 135, 2, 'ocean View', true, NULL, 4),
(18, 'Queen', 175, 2, 'montain View', false, NULL, 4),
(19, 'Single', 100, 1, 'ocean View', false, NULL, 4),
(20, 'Double', 150, 2, 'montain View', true, NULL, 4),
 -- Hotel 5
(21, 'King', 250, 2, 'ocean View', true, NULL, 5),
(22, 'Single',100, 1, 'montain View', false, NULL, 5),
(23, 'Double', 150, 2, 'montain View', true, NULL, 5),
(24, 'Single', 100, 1, 'ocean View', false, NULL, 5),
(25, 'Double', 150, 2, 'montain View', true, NULL, 5),
 -- Hotel 6
(26, 'Twin', 135, 2, 'ocean View', true, NULL, 6),
(27, 'Queen', 175, 2, 'montain View', true, NULL, 6),
(28, 'Single', 100, 1, 'ocean View', false, NULL, 6),
(29, 'Double', 150, 2, 'montain View', false, NULL, 6),
(30, 'King', 250, 2, 'ocean View', true, NULL, 6),
 -- Hotel 7
(31, 'Single',100, 1, 'montain View', true, NULL, 7),
(32, 'Double', 150, 2, 'montain View', false, NULL, 7),
(33, 'Single', 100, 1, 'ocean View', false, NULL, 7),
(34, 'Double', 150, 2, 'montain View', true, NULL, 7),
(35, 'Twin', 135, 2, 'ocean View', false, NULL, 7),
 -- Hotel 8
(36, 'Queen', 175, 2, 'montain View', false, NULL, 8),
(37, 'Single', 100, 1, 'ocean View', true, NULL, 8),
(38, 'Double', 150, 2, 'montain View', false, NULL, 8),
(39, 'Twin', 135, 2, 'ocean View', false, NULL,8),
(40, 'Queen', 175, 2, 'montain View', true, NULL, 8),
 -- Hotel 9
(41, 'Single', 100, 1, 'ocean View', true, NULL, 26),
(42, 'Double', 150, 2, 'montain View', false, NULL, 26),
(43, 'King', 250, 2, 'ocean View', true, NULL, 26),
(44, 'Single',100, 1, 'montain View', true, NULL,26),
(45, 'Double', 150, 2, 'montain View', false, NULL, 26),
 -- Hotel 10
(46, 'Single', 100, 1, 'ocean View', true, NULL, 27),
(47, 'Double', 150, 2, 'montain View', false, NULL, 27),
(48, 'Twin', 135, 2, 'ocean View', true, NULL, 27),
(49, 'Queen', 175, 2, 'montain View', true, NULL, 27),
(50, 'Single', 100, 1, 'ocean View', false, NULL, 27),
 -- Hotel 11
(51, 'Double', 150, 2, 'montain View', false, NULL, 28),
(52, 'King', 250, 2, 'ocean View', true, NULL, 28),
(53, 'Single',100, 1, 'montain View', true, NULL, 28),
(54, 'Double', 150, 2, 'montain View', true, NULL, 28),
(55, 'Single', 100, 1, 'ocean View', false, NULL, 28),
 -- Hotel 12
(56, 'Double', 150, 2, 'montain View', true, NULL, 29),
(57, 'Twin', 135, 2, 'ocean View', false, NULL, 29),
(58, 'Queen', 175, 2, 'montain View', true, NULL, 29),
(59, 'Single', 100, 1, 'ocean View', false, NULL, 29),
(60, 'Double', 150, 2, 'montain View', true, NULL, 29),
 -- Hotel 13
(61, 'King', 250, 2, 'ocean View', true, NULL, 30),
(62, 'Single',100, 1, 'montain View', false, NULL,30),
(63, 'Double', 150, 2, 'montain View', true, NULL, 30),
(64, 'Single', 100, 1, 'ocean View', false, NULL, 30),
(65, 'Double', 150, 2, 'montain View', true, NULL, 30),
 -- Hotel 14
(66, 'Twin', 135, 2, 'ocean View', true, NULL, 31),
(67, 'Queen', 175, 2, 'montain View', true, NULL, 31),
(68, 'Single', 100, 1, 'ocean View', false, NULL, 31),
(69, 'Double', 150, 2, 'montain View', false, NULL, 31),
(70, 'King', 250, 2, 'ocean View', true, NULL, 31),
 -- Hotel 15
(71, 'Single',100, 1, 'montain View', true, NULL, 32),
(72, 'Double', 150, 2, 'montain View', true, NULL, 32),
(73, 'Single', 100, 1, 'ocean View', false, NULL, 32),
(74, 'Double', 150, 2, 'montain View', true, NULL, 32),
(75, 'Twin', 135, 2, 'ocean View', true, NULL, 32),
 -- Hotel 16
(76, 'Queen', 175, 2, 'montain View', true, NULL, 33),
(77, 'Single', 100, 1, 'ocean View', true, NULL, 33),
(78, 'Double', 150, 2, 'montain View', true, NULL, 33),
(79, 'Twin', 135, 2, 'ocean View', false, NULL, 33),
(80, 'Queen', 175, 2, 'montain View', true, NULL, 33);