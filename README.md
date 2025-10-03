# ETL_using_shell_scripting
Extract transform load using bash shell script 
In PostGreSQL need to create tables

for csv2db.sh /etc/passwd file is the input source
for cp-access-log.sh web-server-access-log.txt is the input source

# \c template1
```
create table users(username varchar(50),userid int,homedirectory varchar(100));
create table access_log(timestamp TIMESTAMP, lalitude float, longitude float, visitorid varchar(37));
```
