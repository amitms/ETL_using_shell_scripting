# Extract required fields from the file
#create table in postGreSQL 
#\c template1
#create table access_log(timestamp TIMESTAMP, lalitude float, longitude float, visitorid varchar(37));

echo "Extracting data"
# Extract the columns 1 (timestamp), 2 (latitude), 3 (longitude) and 
# 4 (visitorid)
#cut -d"#" -f1-4 web-server-access-log.txt

# Redirect the extracted output into a file.
cut -d"#" -f1-4 web-server-access-log.txt > acess_log_extracted-data.txt
# Transform the data into CSV format.
echo "Transforming data"
# read the extracted data and replace the colons with commas and
# write it to a csv file
tr "#" "," < acess_log_extracted-data.txt > acess_log_transformed.csv

# Load the data into the table access_log in PostgreSQL
echo "Loading data"
# Send the instructions to connect to 'template1' and
# copy the file to the table 'access_log' through command pipeline.
export PGPASSWORD =jlYc4etG19GyBBVSWnmThBgG;
echo "\c template1;\COPY access_log  FROM '/home/project/acess_log_transformed.csv' DELIMITERS ',' CSV HEADER;" | psql --host 172.21.93.33 -p 5432 -U postgres
#psql --username=postgres --host=localhost