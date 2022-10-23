#!/bin/bash

echo creating icndb Database
sudo su - ${DB2INSTANCE}
db2 create database icndb automatic storage yes using codeset UTF-8 territory US pagesize 32768;

db2 connect to icndb;
db2 grant dbadm on database to user icnadm;
db2 connect reset;

echo creating odmdb Database

db2 create database odmdb automatic storage yes using codeset UTF-8 territory US pagesize 32768;

db2 connect to odmdb;
db2 CREATE BUFFERPOOL BP32K SIZE 2000 PAGESIZE 32K;
db2 CREATE TABLESPACE RESDWTS PAGESIZE 32K BUFFERPOOL BP32K;
db2 CREATE SYSTEM TEMPORARY TABLESPACE RESDWTMPTS PAGESIZE 32K BUFFERPOOL BP32K;
db2 grant dbadm on database to user odmadm;
db2 connect reset;

db2 connect to icndb user icnadm using Passw0rd;
db2 connect reset;

db2 connect to odmdb user odmadm using Passw0rd;
db2 connect reset;

echo Databases icndb & odmdb are ready.