echo "Creating the database"

createdb -h localhost -U postgres -p 5432 UberDW

echo "Creating schema"

psql  -h localhost -U postgres -p 5432 UberDW < /home/duyhung/Desktop/data_warehouse/DW_project/star_schema.sql

echo "Ok"

echo "Loading data to data warehouse"

/home/duyhung/Desktop/data_warehouse/myvenv/bin/python /home/duyhung/Desktop/data_warehouse/DW_project/Load_data_to_postgres.py

echo "Finished loading data"

echo "Verifying data"

psql  -h localhost -U postgres -p 5432 UberDW < verify.sql

echo "Successfully setup the staging area"
