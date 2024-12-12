CREATE DATABASE IF NOT EXISTS hotel_chain;
Use hotel_chain;
-- INDEXES CREATION

-- indexing star rating in the Hotel table
CREATE INDEX Rating_idx ON Hotel(StarRating);

-- indexing stay period in the Reservation table
CREATE INDEX Stay_idx ON Reservation(ArrivalDate, DepartureDate);

-- indexing capacity in the Room table
CREATE INDEX Capacity_idx ON Room(Capacity);

-- indexing the room view in the Room table
CREATE INDEX View_idx ON Room(Room_view);
