CREATE DATABASE IF NOT EXISTS hotel_chain;
USE hotel_chain;

DELIMITER $$

-- search available rooms
CREATE PROCEDURE `SearchAvailableRooms`(
    IN checkInDate DATE, 
    IN checkOutDate DATE, 
    IN capacity INT, 
    IN hotelChain VARCHAR(255), 
    IN minPrice DECIMAL(10,2), 
    IN maxPrice DECIMAL(10,2)
)
BEGIN
    SELECT r.*, hc.Chain_Name, h.Hotel_ID, AVG(r.Price) as AveragePrice
    FROM Room r
    JOIN Hotel h ON r.Hotel_ID = h.Hotel_ID
    JOIN hotelchain hc ON h.Chain_ID = hc.Chain_ID
    WHERE r.Room_ID NOT IN (
        SELECT Room_ID 
        FROM Reservation 
        WHERE (DepartureDate > checkInDate AND ArrivalDate < checkOutDate)
    )
    AND hc.Chain_Name LIKE CONCAT('%', hotelChain, '%')
    AND r.Capacity >= capacity
    AND r.Price BETWEEN minPrice AND maxPrice
    GROUP BY r.Room_ID
    HAVING COUNT(r.Room_ID) > 0;
END$$

-- procedure to adding a reservation
CREATE PROCEDURE `AddReservation`(
    IN reservationDateStr VARCHAR(10), -- Accept date as string in format 'YYYY-MM-DD'
    IN arrivalDateStr VARCHAR(10), -- Accept date as string in format 'YYYY-MM-DD'
    IN departureDateStr VARCHAR(10), -- Accept date as string in format 'YYYY-MM-DD'
    IN clientID INT, 
    IN hotelID INT, 
    IN roomID INT, 
    IN employeeID INT
)
BEGIN
    DECLARE reservationDate DATE;
    DECLARE arrivalDate DATE;
    DECLARE departureDate DATE;
    
    -- Convert string dates to DATE format
    SET reservationDate = STR_TO_DATE(reservationDateStr, '%Y-%m-%d');
    SET arrivalDate = STR_TO_DATE(arrivalDateStr, '%Y-%m-%d');
    SET departureDate = STR_TO_DATE(departureDateStr, '%Y-%m-%d');
    
    -- Validate dates
    IF reservationDate IS NULL OR arrivalDate IS NULL OR departureDate IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid date format';
    END IF;

    -- Insert reservation into Reservation table
    INSERT INTO Reservation (ReservationDate, ArrivalDate, DepartureDate, Client_ID, Hotel_ID, Room_ID, Employee_ID)
    VALUES (reservationDate, arrivalDate, departureDate, clientID, hotelID, roomID, employeeID);
END$$

-- Procedure to cancel a reservation
CREATE PROCEDURE `CancelReservation`(
    IN reservationID INT
)
BEGIN
    DELETE FROM Reservation WHERE Reservation_ID = reservationID;
END$$

-- Checkin converts a reservation to a rental
CREATE PROCEDURE `CheckIn`(
    IN reservationID INT,
    IN rentalDate DATE,
    IN amountPaid DECIMAL(10,2)
)
BEGIN
    DECLARE clientID INT;
    DECLARE roomID INT;
    DECLARE arrival_date DATE;
    DECLARE departure_date DATE;
    DECLARE roomPrice DECIMAL(10, 2);

    -- Retrieve reservation details
    SELECT Client_ID, Room_ID, ArrivalDate, DepartureDate
    INTO clientID, roomID, arrival_date, departure_date
    FROM Reservation
    WHERE Reservation_ID = reservationID;

    -- Retrive the room price
    SELECT Price INTO roomPrice
    FROM Room
    WHERE Room_ID = roomID;

    -- Print statement to display the retrieved dates
    SELECT 'Arrival Date:', arrival_date, '; Departure Date:', departure_date;

    -- Insert into Rental table
    INSERT INTO Rental (RentalDate, ArrivalDate, DepartureDate, Price, Client_ID, Room_ID, Reservation_ID, amount_paid)
    VALUES (rentalDate, arrival_date, departure_date, roomPrice, clientID, roomID, reservationID, amountPaid);

    -- Update amount_paid in Rental table
    UPDATE Rental
    SET amount_paid = amountPaid
    WHERE Reservation_ID = reservationID;
    
END$$


-- Procedure for adding a client
CREATE PROCEDURE `AddClient`(
    IN firstName VARCHAR(255), 
    IN lastName VARCHAR(255),
    IN streetName VARCHAR(255),
    IN streetNumb VARCHAR(255),
    IN aptNumb VARCHAR(255),
    IN city VARCHAR(255),
    IN province VARCHAR(255),
    IN zipCode VARCHAR(255),
    IN sin VARCHAR(255)
)
BEGIN
    INSERT INTO Client (FirstName, LastName, Street_Name, Street_Numb, Apt_Numb, City, Province, Zip_Code, SIN)
    VALUES (firstName, lastName, streetName, streetNumb, aptNumb, city, province, zipCode, sin);
END$$


-- Procedure for handling a payment (example: marking a rental as paid)
CREATE PROCEDURE `ProcessPayment`(
    IN rentalID INT, 
    IN amountPaid DECIMAL(10,2)
)
BEGIN
    UPDATE Rental
    SET amount_paid = amount_paid + amountPaid
    WHERE Rental_ID = rentalID;
END$$


-- Procedure for adding an employee
CREATE PROCEDURE `AddEmployee`(
    IN firstName VARCHAR(255), 
    IN lastName VARCHAR(255),
    IN streetName VARCHAR(255),
    IN streetNumb VARCHAR(255),
    IN aptNumb VARCHAR(255),
    IN city VARCHAR(255),
    IN province VARCHAR(255),
    IN zipCode VARCHAR(255),
    IN hotelID INT
)
BEGIN
    INSERT INTO Employee (FirstName, LastName, Street_Name, Street_Numb, Apt_Numb, City, Province, Zip_Code, Hotel_ID)
    VALUES (firstName, lastName, streetName, streetNumb, aptNumb, city, province, zipCode, hotelID);
END$$


-- Procedure for creating a rental with additional checks
CREATE PROCEDURE `CreateRental`(
    IN rentalDate DATE,
    IN arrivalDate DATE,
    IN departureDate DATE,
    IN price DECIMAL(10, 2),
    IN clientID INT,
    IN roomID INT,
    IN amountPaid DECIMAL(10, 2),
    IN reservationID INT
)
BEGIN
    DECLARE roomOccupied INT;
    
    -- Check if the room is available for the given dates
    SELECT COUNT(*) INTO roomOccupied
    FROM Reservation
    WHERE Room_ID = roomID
    AND ((ArrivalDate <= arrivalDate AND DepartureDate >= arrivalDate)
         OR (ArrivalDate <= departureDate AND DepartureDate >= departureDate)
         OR (ArrivalDate >= arrivalDate AND DepartureDate <= departureDate));
    
    IF roomOccupied > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Room not available for the specified dates';
    END IF;

    -- Check if arrival date is before departure date
    IF arrivalDate >= departureDate THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Departure date must be after arrival date';
    END IF;
    
    -- Check if rental date is within the arrival and departure dates
    IF rentalDate < arrivalDate OR rentalDate > departureDate THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rental date must be within arrival and departure dates';
    END IF;
    
    -- Insert rental data into Rental table
    INSERT INTO Rental (RentalDate, ArrivalDate, DepartureDate, Price, Client_ID, Room_ID, amount_paid, Reservation_ID)
    VALUES (rentalDate, arrivalDate, departureDate, price, clientID, roomID, amountPaid, reservationID);
END$$


DELIMITER ;





