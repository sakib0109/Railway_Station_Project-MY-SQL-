Use master
go
--if database exists then delete
if exists (select name from sys.databases where name ='Railway_StationDB')
begin
drop database Railway_StationDB;
end;
GO

CREATE DATABASE Railway_StationDB
ON PRIMARY
(
    NAME = N'Railway_StationDB_DATA_1',
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Railway_StationDB_DATA_1.mdf',
    SIZE = 75MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5%
)
LOG ON
(
    NAME = N'Railway_StationDB_LOG_1',
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Railway_StationDB_LOG_1.ldf',
    SIZE = 50MB,
    MAXSIZE = 75MB,
    FILEGROWTH = 5%
);
GO

-- create tables

create table stations (
    stationid int primary key,
    stationname nvarchar(100),
    location nvarchar(255),
    stationtype nvarchar(50),
    latitude float,
    longitude float
);

create table trains (
    trainid int primary key,
    trainmodel nvarchar(50),
    capacity int,
    status nvarchar(50)
);

create table schedules (
    scheduleid int primary key,
    trainid int,
    stationid int,
    departuretime datetime,
    arrivaltime datetime,
    dayofweek nvarchar(20),
    foreign key (trainid) references trains(trainid),
    foreign key (stationid) references stations(stationid)
);

create table passengers (
    passengerid int primary key,
    fullname nvarchar(100),
    dateofbirth date,
    contactdetails nvarchar(100),
    gender nvarchar(10)
);

create table tickets (
    ticketid int primary key,
    passengerid int,
    scheduleid int,
    tickettype nvarchar(50),
    fare decimal(10, 2),
    paymentstatus nvarchar(20),
    purchasedate datetime,
    foreign key (passengerid) references passengers(passengerid),
    foreign key (scheduleid) references schedules(scheduleid)
);

create table staff (
    staffid int primary key,
    fullname nvarchar(100),
    role nvarchar(50),
    stationid int null,
    trainid int null,
    startdate date,
    foreign key (stationid) references stations(stationid),
    foreign key (trainid) references trains(trainid)
);

create table maintenancerecords (
    maintenanceid int primary key,
    trainid int,
    maintenancetype nvarchar(50),
    maintenancedate datetime,
    duration int,
    status nvarchar(50),
    foreign key (trainid) references trains(trainid)
);

create table operations (
    operationid int primary key,
    trainid int,
    operationdate datetime,
    departurestationid int,
    arrivalstationid int,
    status nvarchar(50),
    foreign key (trainid) references trains(trainid),
    foreign key (departurestationid) references stations(stationid),
    foreign key (arrivalstationid) references stations(stationid)
);

-- create triggers

-- prevent duplicate schedules
Go
create trigger preventduplicateschedules
on schedules
after insert
as
begin
    if exists (
        select 1
        from schedules s
        inner join inserted i on s.trainid = i.trainid and s.stationid = i.stationid and s.dayofweek = i.dayofweek
        where s.scheduleid != i.scheduleid
    )
    begin
        raiserror('duplicate schedule for this train on the same day and station.', 16, 1);
        rollback transaction;
    end
end;

-- prevent duplicate ticket purchase by same passenger for same schedule
GO
create trigger preventduplicateticketpurchase
on tickets
after insert
as
begin
    if exists (
        select 1
        from tickets t
        inner join inserted i on t.passengerid = i.passengerid and t.scheduleid = i.scheduleid
        where t.ticketid != i.ticketid
    )
    begin
        raiserror('this passenger already has a ticket for this schedule.', 16, 1);
        rollback transaction;
    end
end;

-- prevent assigning multiple drivers to the same train
GO
create trigger preventduplicatetrainassignment
on staff
after insert
as
begin
    if exists (
        select 1
        from staff s
        inner join inserted i on s.trainid = i.trainid and s.role = 'driver'
        where s.staffid != i.staffid
    )
    begin
        raiserror('this driver is already assigned to this train.', 16, 1);
        rollback transaction;
    end
end;

-- update train status after maintenance completion
GO
create trigger updatetrainstatusaftermaintenance
on maintenancerecords
after update
as
begin
    if exists (
        select 1
        from inserted i
        where i.status = 'completed'
    )
    begin
        update trains 
        set status = 'active'
        where trainid in (select trainid from inserted);
    end
end;

-- create procedures

-- get schedules for a station
GO
create procedure getschedulesforstation (@station_id int)
as
begin
    select s.scheduleid, s.trainid, s.departuretime, s.arrivaltime, s.dayofweek
    from schedules s 
    where s.stationid = @station_id;
end;

-- tickets for a passenger
GO
create procedure getticketsforpassenger (@passenger_id int)
as
begin
    select t.ticketid, t.scheduleid, t.tickettype, t.fare, t.paymentstatus, t.purchasedate
    from tickets t
    where t.passengerid = @passenger_id;
end;

-- staff for a station
GO
create procedure getstaffforstation (@station_id int)
as
begin
    select s.staffid, s.fullname, s.role, s.startdate 
    from staff s
    where s.stationid = @station_id;
end;

-- maintenance records for a train
GO
create procedure getmaintenancefortrain (@train_id int)
as
begin
    select m.maintenanceid, m.maintenancetype, m.maintenancedate, m.duration, m.status
    from maintenancerecords m
    where m.trainid = @train_id;
end;

-- create functions

-- train count at a station
GO
create function gettraincountatstation (@station_id int)
returns int
as
begin
    declare @train_count int;
    select @train_count = count(distinct trainid)
    from schedules
    where stationid = @station_id;
    return @train_count;
end;

-- total fare for a passenger
GO
create function gettotalfareforpassenger (@passenger_id int)
returns decimal(10, 2)
as
begin
    declare @total_fare decimal(10, 2);
    select @total_fare = sum(fare)
    from tickets
    where passengerid = @passenger_id;
    return @total_fare;
end;

-- driver count for a train
GO
create function getdrivercountfortrain (@train_id int)
returns int
as
begin
    declare @driver_count int;
    select @driver_count = count(*)
    from staff
    where trainid = @train_id and role = 'driver';
    return @driver_count;
end;

-- completed maintenance count for a train
GO
create function getcompletedmaintenancecount (@train_id int)
returns int
as
begin
    declare @maintenance_count int;
    select @maintenance_count = count(*)
    from maintenancerecords
    where trainid = @train_id and status = 'completed';
    return @maintenance_count;
end;

-- cte for latest maintenance
GO
with latestmaintenance as (
    select m.trainid, m.maintenancetype, m.maintenancedate, m.status,
           row_number() over (partition by m.trainid order by m.maintenancedate desc) as rn
    from maintenancerecords m
)
select t.trainid, t.trainmodel, lm.maintenancetype, lm.maintenancedate, lm.status
from trains t
left join latestmaintenance lm on t.trainid = lm.trainid and lm.rn = 1;

-- merge: update train status after maintenance
merge into trains t
using maintenancerecords m
on t.trainid = m.trainid
when matched and m.status = 'completed' then
    update set t.status = 'active'
when not matched by target then
    insert (trainid, trainmodel, status)
    values (m.trainid, 'unknown model', 'inactive');

-- query to show passengers who paid for their tickets
select p.passengerid, p.fullname, t.ticketid, t.tickettype, t.fare
from passengers p
join tickets t on p.passengerid = t.passengerid
where t.paymentstatus = 'paid';

-- query 1: list all stations with their location and type
select stationid, stationname, [location], stationtype
from stations;

-- query 2: get trains with 'maintenance pending' status
select trainid, trainmodel, status
from trains
where status = 'maintenance pending';

-- query 3: get schedules for a given day of the week
select scheduleid, trainid, stationid, departuretime, arrivaltime, dayofweek
from schedules
where dayofweek = 'Monday';

-- Query 4: Total fare collected
SELECT SUM(fare) AS TotalFare
FROM tickets;

-- Query 5: Get staff assigned to a specific station
SELECT s.staffid, s.fullname, s.role
FROM staff s
WHERE s.stationid = 1;

-- Query 6: Get the average fare for tickets sold
SELECT AVG(fare) AS AverageFare
FROM tickets;

-- Query 7: Find the most recent maintenance for a train
SELECT m.maintenanceid, m.maintenancetype, m.maintenancedate, m.status
FROM maintenancerecords m
WHERE m.trainid = 101 -- Example train ID
ORDER BY m.maintenancedate DESC;

-- Query 8: List all passengers who bought tickets for a specific schedule
SELECT p.passengerid, p.fullname
FROM passengers p
JOIN tickets t ON p.passengerid = t.passengerid
WHERE t.scheduleid = 1; -- Example schedule ID
-- Query 9: List of all staff working on trains in a specific role (e.g., drivers)
SELECT s.staffid, s.fullname, s.role, t.trainid, t.trainmodel
FROM staff s
JOIN trains t ON s.trainid = t.trainid
WHERE s.role = 'driver';

-- Query 10: Get the list of all trains arriving at a specific station on a given day of the week
SELECT t.trainid, t.trainmodel, s.stationname, sc.departuretime, sc.arrivaltime
FROM trains t
JOIN schedules sc ON t.trainid = sc.trainid
JOIN stations s ON sc.stationid = s.stationid
WHERE s.stationname = 'Station A' AND sc.dayofweek = 'Monday';

-- Query 11: Get the total number of passengers who have boarded trains at a given station
SELECT s.stationname, COUNT(t.ticketid) AS total_passengers
FROM stations s
JOIN schedules sc ON s.stationid = sc.stationid
JOIN tickets t ON sc.scheduleid = t.scheduleid
GROUP BY s.stationname;

-- Query 12: Find all trains with more than a specific capacity (e.g., capacity > 100)
SELECT trainid, trainmodel, capacity
FROM trains
WHERE capacity > 100;

-- Query 13: Get the list of all maintenance records for trains that are still under maintenance
SELECT m.maintenanceid, m.trainid, m.maintenancetype, m.maintenancedate, m.status
FROM maintenancerecords m
WHERE m.status = 'under maintenance';

-- Query 14: Get the fare for the most expensive ticket sold for a specific train
SELECT MAX(fare) AS max_fare
FROM tickets t
JOIN schedules sc ON t.scheduleid = sc.scheduleid
WHERE sc.trainid = 1; -- Example train ID

-- Query 15: Get the most recent operation for a specific train
SELECT o.operationid, o.operationdate, o.departurestationid, o.arrivalstationid, o.status
FROM operations o
WHERE o.trainid = 1 -- Example train ID
ORDER BY o.operationdate DESC

-- Query 16: Find the number of trains arriving at a station within the next 24 hours
SELECT COUNT(*) AS arriving_trains
FROM schedules s
JOIN stations st ON s.stationid = st.stationid
WHERE st.stationname = 'Station A'
AND s.arrivaltime BETWEEN GETDATE() AND DATEADD(HOUR, 24, GETDATE());

-- Query 17: Get all passengers who bought tickets for trains arriving after a specific time
SELECT p.passengerid, p.fullname, t.ticketid, sc.arrivaltime
FROM passengers p
JOIN tickets t ON p.passengerid = t.passengerid
JOIN schedules sc ON t.scheduleid = sc.scheduleid
WHERE sc.arrivaltime > '2024-11-28 12:00:00'; -- Example time

-- Query 18: Get the list of staff who are working on a particular train (e.g., trainid = 2)
SELECT s.staffid, s.fullname, s.role
FROM staff s
WHERE s.trainid = 2; -- Example train ID

-- Query 19: List of all trains that have not yet departed for the day
SELECT t.trainid, t.trainmodel, sc.departuretime
FROM trains t
JOIN schedules sc ON t.trainid = sc.trainid
WHERE sc.departuretime > GETDATE(); -- Trains yet to depart today

-- Query 20: Get the average maintenance duration for all trains
SELECT AVG(m.duration) AS avg_maintenance_duration
FROM maintenancerecords m;
