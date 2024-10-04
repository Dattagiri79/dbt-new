 create or replace temp table DBT.USERS.TRANS(id int,name varchar(255),salary float);
    insert into DBT.USERS.TRANS(id,name,salary) select * from DBT.PUBLIC.dbtuse;

    select * from DBT.USERS.TRANS