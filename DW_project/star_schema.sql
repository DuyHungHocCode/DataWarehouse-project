
BEGIN;

CREATE TABLE public."FactTable"
(
    trip_id integer NOT NULL,
    Vendor_id integer NOT NULL,
    datetime_id integer NOT NULL,
    passenger_count_Id integer NOT NULL,
    trip_distance_id integer NOT NULL,
    rate_code_id integer NOT NULL,
    pickup_location_Id integer NOT NULL,
    dropoff_location_id integer NOT NULL,
    payment_type_id integer NOT NULL,
    store_and_fwd_flag varchar(10),
    fare_amount float,
    extra float,
    mta_tax float,
    tip_amount float,
    tolls_amount float,
    improvement_surcharge float,
    total_amount float,
    PRIMARY KEY (trip_id)
);

CREATE TABLE public."DimDateTime"
(
    datetime_id integer NOT NULL,
    tpep_pickup_datetime TIMESTAMP,
    pick_hour integer,
    pick_day integer,
    pick_month integer,
    pick_year integer,
    pick_weekday integer,
    tpep_dropoff_datetime TIMESTAMP,
    drop_hour integer,
    drop_day integer,
    drop_month integer,
    drop_year integer,
    drop_weekday integer,
    PRIMARY KEY (datetime_id)
);

CREATE TABLE public."DimPassengerCount"
(
    passenger_count_Id integer NOT NULL,
    passenger_count integer,
    PRIMARY KEY (passenger_count_Id)
);

CREATE TABLE public."DimTripDistance"
(
    trip_distance_id integer NOT NULL,
    trip_distance float,
    PRIMARY KEY (trip_distance_id)
);

CREATE TABLE public."DimRateCode"
(
    rate_code_id integer NOT NULL,
    RatecodeID integer,
    rate_code_name varchar(100),
    PRIMARY KEY (rate_code_id)
);

CREATE TABLE public."DimPickupLocation"
(
    pickup_location_Id integer NOT NULL,
    pickup_latitude float,
    pickup_longitude float,
    PRIMARY KEY (pickup_location_Id)
);

create TABLE public."DimDropoffLocation"
(
    dropoff_location_id integer NOT NULL,
    dropoff_latitude float,
    dropoff_longitude float,
    PRIMARY KEY (dropoff_location_id)
);

create TABLE public."DimPaymentType"
(
    payment_type_id integer NOT NULL,
    payment_type integer,
    payment_type_name varchar(50),
    PRIMARY KEY (payment_type_id)
);

ALTER TABLE public."FactTable"
    ADD FOREIGN KEY (datetime_id)
    REFERENCES public."DimDateTime" (datetime_id)
    NOT VALID;


ALTER TABLE public."FactTable"
    ADD FOREIGN KEY (trip_distance_id)
    REFERENCES public."DimTripDistance" (trip_distance_id)
    NOT VALID;

ALTER TABLE public."FactTable"
    ADD FOREIGN KEY (rate_code_id)
    REFERENCES public."DimRateCode" (rate_code_id)
    NOT VALID;



ALTER TABLE public."FactTable"
    ADD FOREIGN KEY (dropoff_location_id)
    REFERENCES public."DimDropoffLocation" (dropoff_location_id)
    NOT VALID;

ALTER TABLE public."FactTable"
    ADD FOREIGN KEY (payment_type_id)
    REFERENCES public."DimPaymentType" (payment_type_id)
    NOT VALID;

ALTER TABLE public."FactTable"
    ADD FOREIGN KEY (pickup_location_Id)
    REFERENCES public."DimPickupLocation" (pickup_location_Id)
    NOT VALID;


ALTER TABLE public."FactTable"
    ADD FOREIGN KEY (passenger_count_Id)
    REFERENCES public."DimPassengerCount" (passenger_count_Id)
    NOT VALID;


END;