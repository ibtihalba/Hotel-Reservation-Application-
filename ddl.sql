-- SQL commands to create and populate the 'hotel_chain' database
-- Create hotelchain and manually inserting some dummy chains
CREATE DATABASE IF NOT EXISTS hotel_chain;
USE hotel_chain;

-- create HotelChain table if not exists and alter to add auto-increment
CREATE TABLE IF NOT EXISTS HotelChain (
    Chain_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    Street_Name VARCHAR(255),
    Street_Numb INTEGER,
    Apt_Numb INTEGER,
    City VARCHAR(255),
    Province VARCHAR(255),
    Zip_Code VARCHAR(7),
    Chain_Name VARCHAR(255),
    NumbOfHotels INTEGER,
    Email VARCHAR(255),
    TelNo VARCHAR(255)
);

-- create Hotel table if not exists and alter to add auto-increment
CREATE TABLE IF NOT EXISTS Hotel (
    Hotel_ID INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Street_Name VARCHAR(255),
    Street_Numb INTEGER,
    Apt_Numb INTEGER,
    City VARCHAR(255),
    Province VARCHAR(255),
    Zip_Code VARCHAR(7),
    Email VARCHAR(255),
    TelNo VARCHAR(255),
    StarRating INTEGER,
    NumbOfRooms INTEGER,
    Manager_ID INTEGER,
    Chain_ID INTEGER,
    FOREIGN KEY (Chain_ID) REFERENCES HotelChain(Chain_ID)
);

-- create Room table if not exists and alter to add auto-increment
CREATE TABLE IF NOT EXISTS Room (
    Room_ID INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Rtype VARCHAR(255),
    Price DECIMAL(10, 2),
    Capacity INTEGER,
    Room_view VARCHAR(255),
    Amenities VARCHAR(255),
    Extendable BOOLEAN,
    Issues VARCHAR(255),
    Hotel_ID INTEGER,
    FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)
);

-- create Employee table if not exists and alter to add auto-increment
CREATE TABLE IF NOT EXISTS Employee (
    Employee_ID INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Street_Name VARCHAR(255),
    Street_Numb INTEGER,
    Apt_Numb INTEGER,
    City VARCHAR(255),
    Province VARCHAR(255),
    Zip_Code VARCHAR(7),
    Hotel_ID INTEGER,
    FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)
);

-- create Client table if not exists and alter to add auto-increment
CREATE TABLE IF NOT EXISTS Client (
    Client_ID INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Street_Name VARCHAR(255),
    Street_Numb INTEGER,
    Apt_Numb INTEGER,
    City VARCHAR(255),
    Province VARCHAR(255),
    Zip_Code VARCHAR(7),
    SIN INTEGER
);

-- create Reservation table if not exists and alter to add auto-increment
CREATE TABLE IF NOT EXISTS Reservation (
    Reservation_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    ReservationDate DATE,
    ArrivalDate DATE,
    DepartureDate DATE,
    Client_ID INTEGER,
    Hotel_ID INTEGER,
    Room_ID INTEGER,
    Employee_ID INTEGER,
    FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID),
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- create Rental table if not exists, alter to add auto-increment, and add amount paid column
CREATE TABLE IF NOT EXISTS Rental (
    Rental_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    RentalDate DATE,
    ArrivalDate DATE,
    DepartureDate DATE,
    Price DECIMAL(10, 2),
    amount_paid DECIMAL(10,2),
    Client_ID INTEGER,
    Room_ID INTEGER,
    Reservation_ID INTEGER,
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID),
    FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID)
);

-- create History table if not exists and alter to add auto-increment
CREATE TABLE IF NOT EXISTS History (
    History_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    His_type VARCHAR(255),
    ResOrRentDate DATE,
    ArrivalDate DATE,
    DepartureDate DATE,
    Client_ID INTEGER,
    Room_ID INTEGER,
    Employee_ID INTEGER,
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);
