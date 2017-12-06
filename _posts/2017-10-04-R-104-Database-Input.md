---
layout: post  
title: R 기초 104 DB에서 데이터 불러오기 (Database Input)  
date: 2017-10-04  
category: [R for Beginners]  
tag: [R]  
author: hkim  

---

***preface*** 이번 포스트에서는 DB 에서 데이터를 읽어오는 방법에 대하여 설명합니다.

# Access to Database Management Systems (DBMS)

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/input/dbinterface.html](http://www.statmethods.net/input/dbinterface.html)

## ODBC Interface

RODBC 패키지는 ODBC 인터페이스를 통해 데이터베이스 (Microsoft Access 및 Microsoft SQL Server 포함)에 대한 액세스를 제공합니다.

주요 기능은 다음과 같습니다.


Function | Description
---------|------------------
odbcConnect(dsn, uid="", pwd="") | Open a connection to an ODBC database
sqlFetch(channel, sqtable) | Read a table from an ODBC database into a data frame
sqlQuery(channel, query) | Submit a query to an ODBC database and return the results
sqlSave(channel, mydf, tablename = sqtable, append = FALSE) | Write or update (append=True) a data frame to a table in the ODBC database
sqlDrop(channel, sqtable) | Remove a table from the ODBC database
close(channel) | Close the connection

```r
# RODBC Example
# import 2 tables (Crime and Punishment) from a DBMS
# into R data frames (and call them crimedat and pundat)

library(RODBC)
myconn <-odbcConnect("mydsn", uid="Rob", pwd="aardvark")
crimedat <- sqlFetch(myconn, "Crime")
pundat <- sqlQuery(myconn, "select * from Punishment")
close(myconn)
```

## Other Interfaces

RMySQL 패키지는 MySQL 인터페이스를 제공합니다.

ROracle 패키지는 Oracle 인터페이스를 제공합니다.

RJDBC 패키지는 JDBC 인터페이스를 통해 데이터베이스에 대한 액세스를 제공합니다.
