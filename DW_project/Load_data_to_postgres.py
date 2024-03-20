import psycopg2

try:
	conn = psycopg2.connect(
		user = "postgres",
	    password = "duyhung12345",
	    host = "localhost",
	    port = "5432",
	    database = "UberDW")
except Exception as e:
	print("Error connecting to data warehouse")
	print(e)
else:
	print("Successfully connected to warehouse")

#Load data to postgres
cur = conn.cursor()



query = """COPY public."DimDateTime"
           FROM '/home/duyhung/Desktop/data_warehouse/DW_project/Extracted_file/datetime_dim.csv'
           DELIMITER ','
           CSV HEADER;
"""
cur.execute(query)
conn.commit()
print("Insert data to DimDateTime")


query = """COPY public."DimPassengerCount"
           FROM '/home/duyhung/Desktop/data_warehouse/DW_project/Extracted_file/passenger_count_dim.csv'
           DELIMITER ','
           CSV HEADER;
"""
cur.execute(query)
conn.commit()
print("Insert data to DimPassengerCount")


query = """COPY public."DimTripDistance"
           FROM '/home/duyhung/Desktop/data_warehouse/DW_project/Extracted_file/trip_distance_dim.csv'
           DELIMITER ','
           CSV HEADER;
"""
cur.execute(query)
conn.commit()
print("Insert data to DimTripDistance")


query = """COPY public."DimRateCode"
           FROM '/home/duyhung/Desktop/data_warehouse/DW_project/Extracted_file/rate_code_dim.csv'
           DELIMITER ','
           CSV HEADER;
"""
cur.execute(query)
conn.commit()
print("Insert data to DimRateCode")

query = """COPY public."DimPickupLocation"
           FROM '/home/duyhung/Desktop/data_warehouse/DW_project/Extracted_file/pickup_location_dim.csv'
           DELIMITER ','
           CSV HEADER;
"""
cur.execute(query)
conn.commit()
print("Insert data to DimPickupLocation")

query = """COPY public."DimDropoffLocation"
           FROM '/home/duyhung/Desktop/data_warehouse/DW_project/Extracted_file/dropoff_location_dim.csv'
           DELIMITER ','
           CSV HEADER;
"""
cur.execute(query)
conn.commit()
print("Insert data to DimDropoffLocation")

query = """COPY public."DimPaymentType"
           FROM '/home/duyhung/Desktop/data_warehouse/DW_project/Extracted_file/payment_type_dim.csv'
           DELIMITER ','
           CSV HEADER;
"""
cur.execute(query)
conn.commit()
print("Insert data to DimPaymentType")

query = """COPY public."FactTable"
           FROM '/home/duyhung/Desktop/data_warehouse/DW_project/Extracted_file/fact_table.csv'
           DELIMITER ','
           CSV HEADER;
"""
cur.execute(query)
conn.commit()
print("Insert data to Factable")

cur.close()
conn.close()

