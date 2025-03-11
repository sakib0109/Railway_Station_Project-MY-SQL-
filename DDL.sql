
--Creating the Database

DROP DATABASE IF EXISTS Railway_StationDB;
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

--Creating Tables

Create table stations (
    stationid int primary key,
    stationname nvarchar(100),
    [location] nvarchar(255),
    stationtype nvarchar(50),
    latitude float,
    longitude float
);

Create table trains (
    trainid int primary key,
    trainmodel nvarchar(50),
    capacity int,
    [status] nvarchar(50)
);

Create table schedules (
    scheduleid int primary key,
    trainid int,
    stationid int,
    departuretime datetime,
    arrivaltime datetime,
    [dayofweek] nvarchar(20),
    foreign key (trainid) references trains(trainid),
    foreign key (stationid) references stations(stationid)
);

Create table passengers (
    passengerid int primary key,
    fullname nvarchar(100),
    dateofbirth date,
    contactdetails nvarchar(100),
    gender nvarchar(10)
);

Create table tickets (
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

Create table staff (
    staffid int primary key,
    fullname nvarchar(100),
    role nvarchar(50),
    stationid int null,
    trainid int null,
    startdate date,
    foreign key (stationid) references stations(stationid),
    foreign key (trainid) references trains(trainid)
);

Create table maintenancerecords (
    maintenanceid int primary key,
    trainid int,
    maintenancetype nvarchar(50),
    maintainedate datetime,
    duration int,
    status nvarchar(50),
    foreign key (trainid) references trains(trainid)
);

Create table operations (
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

-- Triggers

Create trigger preventduplicateschedules
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

-- Duplicate ticket purchase by same passenger for same schedule

Create trigger preventduplicateticketpurchase
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

Create trigger preventduplicatetrainassignment
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

-- Update train status after maintenance completion

Create trigger updatetrainstatusaftermaintenance
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

-- Procedures

-- Get schedules for a station

Create procedure getschedulesforstation (@station_id int)
as
begin
    select s.scheduleid, s.trainid, s.departuretime, s.arrivaltime, s.dayofweek
    from schedules s 
    where s.stationid = @station_id;
end;

-- Tickets for a passenger

Create procedure getticketsforpassenger (@passenger_id int)
as
begin
    select t.ticketid, t.scheduleid, t.tickettype, t.fare, t.paymentstatus, t.purchasedate
    from tickets t
    where t.passengerid = @passenger_id;
end;

--Staff for a station

Create procedure getstaffforstation (@station_id int)
as
begin
    select s.staffid, s.fullname, s.role, s.startdate 
    from staff s
    where s.stationid = @station_id;
end;

--Maintenance records for a train

Create procedure getmaintenancefortrain (@train_id int)
as
begin
    select m.maintenanceid, m.maintenancetype, m.maintenancedate, m.duration, m.status
    from maintenancerecords m
    where m.trainid = @train_id;
end;

--Functions

--Train count at a station

Create function gettraincountatstation (@station_id int)
returns int
as
begin
    declare @train_count int;
    select @train_count = count(distinct trainid)
    from schedules
    where stationid = @station_id;
    return @train_count;
end;

--Total fare for a passenger

Create function gettotalfareforpassenger (@passenger_id int)
returns decimal(10, 2)
as
begin
    declare @total_fare decimal(10, 2);
    select @total_fare = sum(fare)
    from tickets
    where passengerid = @passenger_id;
    return @total_fare;
end;

--Driver count for a train

Create function getdrivercountfortrain (@train_id int)
returns int
as
begin
    declare @driver_count int;
    select @driver_count = count(*)
    from staff
    where trainid = @train_id and role = 'driver';
    return @driver_count;
end;

--Completed maintenance count for a train

Create function getcompletedmaintenancecount (@train_id int)
returns int
as
begin
    declare @maintenance_count int;
    select @maintenance_count = count(*)
    from maintenancerecords
    where trainid = @train_id and status = 'completed';
    return @maintenance_count;
end;
