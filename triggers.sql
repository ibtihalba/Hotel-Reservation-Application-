CREATE DATABASE IF NOT EXISTS hotel_chain;
USE hotel_chain;

DELIMITER //

-- Trigger to decrease the number of available rooms after a reservation is inserted
CREATE TRIGGER update_res_after_insert
AFTER INSERT ON Reservation
FOR EACH ROW
BEGIN
    UPDATE Hotel
    SET num_availableRooms = num_availableRooms - 1
    WHERE Hotel_ID = NEW.Hotel_ID;
END;

-- Trigger to increase the number of available rooms after a reservation is deleted
CREATE TRIGGER update_res_after_delete
AFTER DELETE ON Reservation
FOR EACH ROW
BEGIN
    UPDATE Hotel
    SET num_availableRooms = num_availableRooms + 1
    WHERE Hotel_ID = OLD.Hotel_ID;
END;

-- Trigger to prevent the deletion of a hotel entry if there are active reservations for it
CREATE TRIGGER prevent_delete_hotel
BEFORE DELETE ON Hotel
FOR EACH ROW
BEGIN
    DECLARE cnt INT;
    SELECT COUNT(*) INTO cnt FROM Reservation WHERE Hotel_ID = OLD.Hotel_ID AND DepartureDate >= CURRENT_DATE;
    IF cnt > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete hotel with active reservations';
    END IF;
END;

DELIMITER ;
