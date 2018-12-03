CREATE TABLE Customer (
        cust_id VARCHAR(40) NOT NULL,
        fname VARCHAR(50) NOT NULL,
        lname VARCHAR(50) NOT NULL,
        bdate DATE NOT NULL,
        pref_smoking BOOLEAN NULL, /* if null, then assume false */
        pref_pets BOOLEAN NULL,
        email VARCHAR(40) NOT NULL,
        password CHAR(40) NULL, /* note that character limit is 40, will throw error */
        PRIMARY KEY (cust_id),
        UNIQUE KEY (email)
);

CREATE TABLE Room_setup (
        setupID CHAR(8) NOT NULL,
        bed INT(10) NOT NULL,
        windows INT(10) NOT NULL,
        PRIMARY KEY (setupID)
);

CREATE TABLE Room_info (
        roomNo CHAR(10) NOT NULL,
        setupID CHAR(8) NOT NULL,
        room_size INT(250) NOT NULL, /* measured by square feet */
        price DECIMAL(6,2) NOT NULL, /* price per night */
        PRIMARY KEY (roomNo),
        FOREIGN KEY (setupID) REFERENCES Room_setup(setupID)
);

CREATE TABLE Reservation (
        cust_id VARCHAR(40) NOT NULL,
        roomNo CHAR(10) NOT NULL,
        check_in_date DATE NOT NULL, /* default date format is YYYY-MM-DD. use this when doing operations */
        reserve_date DATE NOT NULL,
        check_out_date DATE NOT NULL,
        PRIMARY KEY (cust_id,roomNo),
        FOREIGN KEY (cust_id) REFERENCES Customer(cust_id),
        FOREIGN KEY (roomNo) REFERENCES Room_info(roomNo),
        CONSTRAINT unique_reservation UNIQUE (reserve_date,roomNo)
);

/* testing purposes */
CREATE TABLE Employee (
        uname VARCHAR(50) NOT NULL, /* username */
        PRIMARY KEY (uname)
);
