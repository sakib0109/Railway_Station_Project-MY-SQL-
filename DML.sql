
-- Insert data Stations 
Insert into stations (stationid, stationname, [location], stationtype, latitude, longitude)
values
	(1, 'Dhaka Cantonment', 'Dhaka', 'Terminal', 23.8103, 90.4118),
	(2, 'Kamalapur', 'Dhaka', 'Transfer', 23.8108, 90.4055),
	(3, 'Moghbazar', 'Dhaka', 'Intermediate', 23.7657, 90.3905),
	(4, 'Bashundhara', 'Dhaka', 'Intermediate', 23.7956, 90.4264),
	(5, 'Uttara North', 'Uttara, Dhaka', 'Transfer', 23.8645, 90.4021),
	(6, 'Uttara South', 'Uttara, Dhaka', 'Intermediate', 23.8582, 90.3995),
	(7, 'Mohammadpur', 'Dhaka', 'Intermediate', 23.7625, 90.3583),
	(8, 'Sadarghat', 'Dhaka', 'Transfer', 23.7901, 90.4098),
	(9, 'Jatrabari', 'Dhaka', 'Intermediate', 23.7323, 90.4439),
	(10, 'New Market', 'Dhaka', 'Intermediate', 23.7412, 90.3999),
	(11, 'Shahbagh', 'Dhaka', 'Intermediate', 23.7428, 90.3899),
	(12, 'Shahjadpur', 'Dhaka', 'Intermediate', 23.7826, 90.4154),
	(13, 'Mirpur-10', 'Dhaka', 'Transfer', 23.8107, 90.3672),
	(14, 'Mirpur-11', 'Dhaka', 'Intermediate', 23.8272, 90.3577),
	(15, 'Banani', 'Dhaka', 'Intermediate', 23.7952, 90.3965),
	(16, 'Dhanmondi', 'Dhaka', 'Intermediate', 23.7475, 90.3745),
	(17, 'Gulshan-1', 'Dhaka', 'Transfer', 23.7894, 90.3992),
	(18, 'Gulshan-2', 'Dhaka', 'Intermediate', 23.7910, 90.4070),
	(19, 'Tejgaon', 'Dhaka', 'Intermediate', 23.7747, 90.4103),
	(20, 'Mouchak', 'Dhaka', 'Intermediate', 23.7569, 90.4171),
	(21, 'Puran Dhaka', 'Dhaka', 'Intermediate', 23.7115, 90.3925),
	(22, 'Biman Bangladesh', 'Dhaka', 'Transfer', 23.8231, 90.4065),
	(23, 'Rayerbazar', 'Dhaka', 'Intermediate', 23.7482, 90.3607),
	(24, 'Chittagong Station', 'Chittagong', 'Terminal', 22.3569, 91.7832),
	(25, 'Sylhet Railway Station', 'Sylhet', 'Terminal', 24.8893, 91.8333),
	(26, 'Rajshahi Railway Station', 'Rajshahi', 'Terminal', 24.3749, 88.6045),
	(27, 'Khulna Railway Station', 'Khulna', 'Terminal', 22.8456, 89.5400),
	(28, 'Barisal Railway Station', 'Barisal', 'Terminal', 22.7017, 90.3501),
	(29, 'Bogura Railway Station', 'Bogura', 'Terminal', 24.8404, 89.3663),
	(30, 'Narayanganj Railway Station', 'Narayanganj', 'Intermediate', 23.6361, 90.5005);


-- Insert Train Data 
Insert into trains (trainmodel, capacity, [status])
values
	(1, 'Local Express', 150, 'Active'),
	(2, 'Intercity-1', 300, 'Active'),
	(3, 'Intercity-2', 250, 'Active'),
	(4, 'Duronto Express', 500, 'Active'),
	(5, 'Maitree Express', 200, 'Active'),
	(6, 'Sundarban Express', 350, 'Inactive'),
	(7, 'Chittagong Express', 300, 'Under Maintenance'),
	(8, 'Rajshahi Express', 400, 'Active'),
	(9, 'Sylhet Express', 180, 'Active'),
	(10, 'Kolkata Express', 200, 'Inactive');

--insert schedules
Insert into schedules (scheduleid, trainid, stationid, departuretime, arrivaltime, dayofweek)
values
	(1, 1, 1, '2024-11-25 06:30:00', '2024-11-25 07:00:00', 'Monday'),
	(2, 2, 3, '2024-11-25 07:30:00', '2024-11-25 08:00:00', 'Monday'),
	(3, 3, 4, '2024-11-25 08:15:00', '2024-11-25 08:45:00', 'Monday'),
	(4, 4, 5, '2024-11-25 09:00:00', '2024-11-25 09:30:00', 'Monday'),
	(5, 5, 6, '2024-11-25 09:45:00', '2024-11-25 10:15:00', 'Monday'),
	(6, 6, 7, '2024-11-25 10:30:00', '2024-11-25 11:00:00', 'Monday'),
	(7, 7, 8, '2024-11-25 11:15:00', '2024-11-25 11:45:00', 'Monday'),
	(8, 8, 9, '2024-11-25 12:00:00', '2024-11-25 12:30:00', 'Monday'),
	(9, 9, 10, '2024-11-25 13:00:00', '2024-11-25 13:30:00', 'Monday'),
	(10, 10, 11, '2024-11-25 14:00:00', '2024-11-25 14:30:00', 'Monday'),
	(11, 1, 12, '2024-11-25 15:00:00', '2024-11-25 15:30:00', 'Saturday'),
	(12, 2, 13, '2024-11-25 16:00:00', '2024-11-25 16:30:00', 'Saturday'),
	(13, 3, 14, '2024-11-25 17:00:00', '2024-11-25 17:30:00', 'Saturday'),
	(14, 4, 15, '2024-11-25 18:00:00', '2024-11-25 18:30:00', 'Saturday'),
	(15, 5, 16, '2024-11-25 19:00:00', '2024-11-25 19:30:00', 'Saturday'),
	(16, 6, 17, '2024-11-25 20:00:00', '2024-11-25 20:30:00', 'Saturday'),
	(17, 7, 18, '2024-11-25 21:00:00', '2024-11-25 21:30:00', 'Saturday'),
	(18, 8, 19, '2024-11-25 22:00:00', '2024-11-25 22:30:00', 'Saturday'),
	(19, 9, 20, '2024-11-25 23:00:00', '2024-11-25 23:30:00', 'Saturday'),
	(20, 10, 21, '2024-11-25 23:45:00', '2024-11-26 00:15:00', 'Saturday');

--Passengers Table:

Insert into passengers (passengerid, fullname, dateofbirth, contactdetails, gender)
values
	(1, 'Abdul Hannan', '1990-05-20', '01712345678', 'Male'),
	(2, 'Shamsun Nahar', '1985-10-13', '01812345678', 'Female'),
	(3, 'Rashedul Islam', '1992-11-25', '01798765432', 'Male'),
	(4, 'Tanzina Akter', '1997-08-15', '01912345678', 'Female'),
	(5, 'Shoaib Rahman', '1983-03-04', '01700000000', 'Male'),
	(6, 'Fahim Ahmed', '1990-02-10', '01723456789', 'Male'),
	(7, 'Jannatul Ferdous', '1995-12-22', '01823456789', 'Female'),
	(8, 'Nasir Uddin', '1989-07-15', '01734567890', 'Male'),
	(9, 'Nusrat Jahan', '1994-11-01', '01923456789', 'Female'),
	(10, 'Saidur Rahman', '1988-04-28', '01745678901', 'Male'),
	(11, 'Shamim Hossain', '1991-09-10', '01834567890', 'Male'),
	(12, 'Mousumi Sultana', '1996-03-20', '01756789012', 'Female'),
	(13, 'Ashikur Rahman', '1993-02-14', '01845678901', 'Male'),
	(14, 'Farhana Akter', '1987-08-30', '01767890123', 'Female'),
	(15, 'Iqbal Hossain', '1992-11-02', '01934567890', 'Male'),
	(16, 'Misha Chowdhury', '1995-05-05', '01778901234', 'Female'),
	(17, 'Zahidul Islam', '1986-06-19', '01867890123', 'Male'),
	(18, 'Razia Begum', '1990-12-12', '01789012345', 'Female'),
	(19, 'Abdullah Al-Mamun', '1991-01-08', '01967890123', 'Male'),
	(20, 'Purnima Islam', '1994-09-25', '01790123456', 'Female'),
	(21, 'Shafiqul Islam', '1988-11-10', '01878901234', 'Male'),
	(22, 'Samira Taufiq', '1997-07-13', '01723456701', 'Female'),
	(23, 'Salman Sani', '1992-04-17', '01912345671', 'Male'),
	(24, 'Sadia Yasmin', '1993-05-28', '01723456782', 'Female'),
	(25, 'Emran Hossain', '1984-03-18', '01834567832', 'Male'),
	(26, 'Nusrat Sultana', '1990-10-25', '01745678932', 'Female'),
	(27, 'Tariq Rahman', '1991-06-21', '01823456712', 'Male'),
	(28, 'Rupa Khatun', '1995-02-09', '01756789022', 'Female'),
	(29, 'Riyad Ahmad', '1992-11-12', '01967890131', 'Male'),
	(30, 'Nazia Rahman', '1996-01-03', '01789012350', 'Female'),
	(31, 'Zahir Uddin', '1985-10-05', '01923456799', 'Male'),
	(32, 'Sharmin Akter', '1993-08-18', '01723456760', 'Female'),
	(33, 'Aminul Islam', '1987-12-17', '01812345670', 'Male'),
	(34, 'Shila Das', '1996-04-12', '01734567822', 'Female'),
	(35, 'Bashir Ahmad', '1989-09-05', '01723456799', 'Male'),
	(36, 'Roshni Sultana', '1994-02-24', '01845678999', 'Female'),
	(37, 'Shahjalal Hossain', '1991-03-16', '01934567856', 'Male'),
	(38, 'Shabana Begum', '1997-11-20', '01767890110', 'Female'),
	(39, 'Sabbir Ahmed', '1992-01-04', '01878901256', 'Male'),
	(40, 'Runa Begum', '1990-07-29', '01989012345', 'Female'),
	(41, 'Samson Roy', '1996-06-19', '01778901245', 'Male'),
	(42, 'Dina Begum', '1987-11-01', '01823456744', 'Female'),
	(43, 'Hassan Ahmed', '1988-02-20', '01756789034', 'Male'),
	(44, 'Sultana Bibi', '1995-04-25', '01978901201', 'Female'),
	(45, 'Kazi Tarikul', '1992-08-02', '01789012360', 'Male'),
	(46, 'Afsana Khatun', '1991-01-01', '01834567845', 'Female'),
	(47, 'Imran Ali', '1993-07-17', '01923456723', 'Male'),
	(48, 'Rubina Naz', '1997-05-09', '01756789035', 'Female'),
	(49, 'Mamunur Rashid', '1990-03-23', '01778901255', 'Male'),
	(50, 'Nazia Tasnim', '1994-12-12', '01823456787', 'Female'),
	(51, 'Mokhlesur Rahman', '1989-06-16', '01734567866', 'Male'),
	(52, 'Ayesha Parveen', '1991-10-10', '01856789029', 'Female'),
	(53, 'Musa Rahman', '1987-09-21', '01723456756', 'Male'),
	(54, 'Farzana Ahmed', '1995-03-14', '01823456789', 'Female'),
	(55, 'Suhana Sultana', '1992-01-01', '01778901278', 'Female'),
	(56, 'Abul Hossain', '1990-04-05', '01723456742', 'Male'),
	(57, 'Mushfiqur Rahman', '1993-11-29', '01834567891', 'Male'),
	(58, 'Mimi Sultana', '1996-10-09', '01923456789', 'Female'),
	(59, 'Sohag Ahmad', '1991-08-10', '01789012343', 'Male'),
	(60, 'Shirin Akter', '1988-12-15', '01823456756', 'Female'),
	(61, 'Aminul Islam', '1989-03-21', '01756789046', 'Male'),
	(62, 'Nina Sultana', '1995-10-23', '01734567821', 'Female'),
	(63, 'Fahima Sultana', '1992-02-14', '01934567865', 'Female'),
	(64, 'Sokhina Khatun', '1990-11-11', '01723456788', 'Female'),
	(65, 'Bashir Hossain', '1987-04-15', '01856789011', 'Male'),
	(66, 'Mithun Roy', '1996-07-12', '01723456731', 'Male'),
	(67, 'Yasmin Akter', '1992-06-01', '01878901290', 'Female'),
	(68, 'Jannat Rahman', '1995-01-09', '01978901207', 'Female'),
	(69, 'Shuvo Saha', '1991-12-25', '01789012334', 'Male'),
	(70, 'Rasel Ahmed', '1994-08-21', '01723456790', 'Male'),
	(71, 'Monira Banu', '1989-02-07', '01756789037', 'Female'),
	(72, 'Azizul Haque', '1990-10-12', '01834567812', 'Male'),
	(73, 'Khushbu Parveen', '1993-09-18', '01723456774', 'Female'),
	(74, 'Shakil Ahmed', '1991-05-29', '01789012367', 'Male'),
	(75, 'Shahinur Akter', '1986-12-05', '01856789026', 'Female'),
	(76, 'Mahabub Alam', '1997-05-14', '01767890111', 'Male'),
	(77, 'Nashit Ahmed', '1994-12-28', '01723456780', 'Male'),
	(78, 'Shilpi Das', '1991-04-18', '01812345672', 'Female'),
	(79, 'Hasina Akter', '1993-06-29', '01978901225', 'Female'),
	(80, 'Tawhidur Rahman', '1987-08-22', '01734567855', 'Male'),
	(81, 'Tania Akter', '1995-09-04', '01867890123', 'Female'),
	(82, 'Anwar Hossain', '1990-05-13', '01778901236', 'Male'),
	(83, 'Sofia Begum', '1992-08-30', '01923456765', 'Female'),
	(84, 'Rakibul Hasan', '1994-04-16', '01789012378', 'Male'),
	(85, 'Khondoker Selim', '1986-07-07', '01834567865', 'Male'),
	(86, 'Samia Sultana', '1997-03-19', '01756789067', 'Female'),
	(87, 'Roni Hossain', '1990-11-02', '01823456780', 'Male'),
	(88, 'Ayesha Parveen', '1993-05-27', '01734567852', 'Female'),
	(89, 'Tushar Ali', '1987-04-03', '01934567895', 'Male'),
	(90, 'Madhumita Das', '1992-06-18', '01756789074', 'Female'),
	(91, 'Ruhul Amin', '1985-02-21', '01723456791', 'Male'),
	(92, 'Shukla Chakraborty', '1991-12-10', '01978901238', 'Female'),
	(93, 'Fariha Nasrin', '1994-01-14', '01878901262', 'Female'),
	(94, 'Azad Rahman', '1989-03-17', '01723456795', 'Male'),
	(95, 'Marufa Begum', '1990-09-28', '01767890134', 'Female'),
	(96, 'Fahim Uddin', '1993-08-02', '01834567859', 'Male'),
	(97, 'Mumita Sultana', '1997-11-18', '01923456796', 'Female'),
	(98, 'Mehedi Hasan', '1986-11-21', '01778901250', 'Male'),
	(99, 'Champa Khatun', '1991-01-30', '01734567860', 'Female'),
	(100, 'Suman Roy', '1988-04-05', '01856789009', 'Male');


--Tiket

Insert into tickets (ticketid, passengerid, scheduleid, tickettype, fare, paymentstatus, purchasedate)
values
	(1, 1, 1, 'One-way', 100.00, 'Paid', '2024-11-25 06:00:00'),
	(2, 2, 2, 'Round-trip', 150.00, 'Paid', '2024-11-25 07:00:00'),
	(3, 3, 3, 'Student', 50.00, 'Paid', '2024-11-25 08:15:00'),
	(4, 4, 4, 'One-way', 120.00, 'Paid', '2024-11-25 09:00:00'),
	(5, 5, 5, 'Round-trip', 140.00, 'Paid', '2024-11-25 09:45:00'),
	(6, 6, 6, 'One-way', 110.00, 'Paid', '2024-11-25 10:30:00'),
	(7, 7, 7, 'Round-trip', 160.00, 'Paid', '2024-11-25 11:00:00'),
	(8, 8, 8, 'Student', 55.00, 'Paid', '2024-11-25 12:15:00'),
	(9, 9, 9, 'One-way', 130.00, 'Paid', '2024-11-25 13:00:00'),
	(10, 10, 10, 'Round-trip', 145.00, 'Paid', '2024-11-25 13:45:00'),
	(11, 11, 11, 'One-way', 125.00, 'Paid', '2024-11-25 14:30:00'),
	(12, 12, 12, 'Round-trip', 155.00, 'Paid', '2024-11-25 15:00:00'),
	(13, 13, 13, 'Student', 60.00, 'Paid', '2024-11-25 15:45:00'),
	(14, 14, 14, 'One-way', 135.00, 'Paid', '2024-11-25 16:00:00'),
	(15, 15, 15, 'Round-trip', 150.00, 'Paid', '2024-11-25 16:30:00'),
	(16, 16, 16, 'One-way', 140.00, 'Paid', '2024-11-25 17:00:00'),
	(17, 17, 17, 'Round-trip', 160.00, 'Paid', '2024-11-25 17:45:00'),
	(18, 18, 18, 'Student', 65.00, 'Paid', '2024-11-25 18:30:00'),
	(19, 19, 19, 'One-way', 125.00, 'Paid', '2024-11-25 19:00:00'),
	(20, 20, 20, 'Round-trip', 150.00, 'Paid', '2024-11-25 19:45:00'),
	(21, 21, 21, 'One-way', 130.00, 'Paid', '2024-11-25 20:30:00'),
	(22, 22, 22, 'Round-trip', 155.00, 'Paid', '2024-11-25 21:00:00'),
	(23, 23, 23, 'Student', 55.00, 'Paid', '2024-11-25 21:45:00'),
	(24, 24, 24, 'One-way', 120.00, 'Paid', '2024-11-25 22:00:00'),
	(25, 25, 25, 'Round-trip', 145.00, 'Paid', '2024-11-25 22:45:00'),
	(26, 26, 26, 'One-way', 110.00, 'Paid', '2024-11-25 23:30:00'),
	(27, 27, 27, 'Round-trip', 160.00, 'Paid', '2024-11-26 00:00:00'),
	(28, 28, 28, 'Student', 50.00, 'Paid', '2024-11-26 00:45:00'),
	(29, 29, 29, 'One-way', 125.00, 'Paid', '2024-11-26 01:30:00'),
	(30, 30, 30, 'Round-trip', 150.00, 'Paid', '2024-11-26 02:00:00'),
	(31, 31, 31, 'One-way', 120.00, 'Paid', '2024-11-26 02:45:00'),
	(32, 32, 32, 'Round-trip', 155.00, 'Paid', '2024-11-26 03:30:00'),
	(33, 33, 33, 'Student', 60.00, 'Paid', '2024-11-26 04:15:00'),
	(34, 34, 34, 'One-way', 135.00, 'Paid', '2024-11-26 05:00:00'),
	(35, 35, 35, 'Round-trip', 145.00, 'Paid', '2024-11-26 05:45:00'),
	(36, 36, 36, 'One-way', 140.00, 'Paid', '2024-11-26 06:30:00'),
	(37, 37, 37, 'Round-trip', 160.00, 'Paid', '2024-11-26 07:00:00'),
	(38, 38, 38, 'Student', 65.00, 'Paid', '2024-11-26 07:45:00'),
	(39, 39, 39, 'One-way', 125.00, 'Paid', '2024-11-26 08:30:00'),
	(40, 40, 40, 'Round-trip', 150.00, 'Paid', '2024-11-26 09:00:00'),
	(41, 41, 41, 'One-way', 130.00, 'Paid', '2024-11-26 09:45:00'),
	(42, 42, 42, 'Round-trip', 155.00, 'Paid', '2024-11-26 10:30:00'),
	(43, 43, 43, 'Student', 55.00, 'Paid', '2024-11-26 11:15:00'),
	(44, 44, 44, 'One-way', 120.00, 'Paid', '2024-11-26 12:00:00'),
	(45, 45, 45, 'Round-trip', 145.00, 'Paid', '2024-11-26 12:30:00'),
	(46, 46, 46, 'One-way', 110.00, 'Paid', '2024-11-26 13:15:00'),
	(47, 47, 47, 'Round-trip', 160.00, 'Paid', '2024-11-26 14:00:00'),
	(48, 48, 48, 'Student', 50.00, 'Paid', '2024-11-26 14:45:00'),
	(49, 49, 49, 'One-way', 125.00, 'Paid', '2024-11-26 15:30:00'),
	(50, 50, 50, 'Round-trip', 150.00, 'Paid', '2024-11-26 16:00:00'),
	(51, 51, 51, 'One-way', 120.00, 'Paid', '2024-11-26 16:45:00'),
	(52, 52, 52, 'Round-trip', 155.00, 'Paid', '2024-11-26 17:30:00'),
	(53, 53, 53, 'Student', 60.00, 'Paid', '2024-11-26 18:00:00'),
	(54, 54, 54, 'One-way', 135.00, 'Paid', '2024-11-26 18:45:00'),
	(55, 55, 55, 'Round-trip', 145.00, 'Paid', '2024-11-26 19:30:00'),
	(56, 56, 56, 'One-way', 140.00, 'Paid', '2024-11-26 20:00:00'),
	(57, 57, 57, 'Round-trip', 160.00, 'Paid', '2024-11-26 20:45:00'),
	(58, 58, 58, 'Student', 65.00, 'Paid', '2024-11-26 21:30:00'),
	(59, 59, 59, 'One-way', 125.00, 'Paid', '2024-11-26 22:00:00'),
	(60, 60, 60, 'Round-trip', 150.00, 'Paid', '2024-11-26 22:45:00'),
	(61, 61, 61, 'One-way', 130.00, 'Paid', '2024-11-26 23:30:00'),
	(62, 62, 62, 'Round-trip', 155.00, 'Paid', '2024-11-27 00:00:00'),
	(63, 63, 63, 'Student', 55.00, 'Paid', '2024-11-27 00:45:00'),
	(64, 64, 64, 'One-way', 120.00, 'Paid', '2024-11-27 01:30:00'),
	(65, 65, 65, 'Round-trip', 145.00, 'Paid', '2024-11-27 02:00:00'),
	(66, 66, 66, 'One-way', 110.00, 'Paid', '2024-11-27 02:45:00'),
	(67, 67, 67, 'Round-trip', 160.00, 'Paid', '2024-11-27 03:30:00'),
	(68, 68, 68, 'Student', 50.00, 'Paid', '2024-11-27 04:15:00'),
	(69, 69, 69, 'One-way', 125.00, 'Paid', '2024-11-27 05:00:00'),
	(70, 70, 70, 'Round-trip', 150.00, 'Paid', '2024-11-27 05:45:00'),
	(71, 71, 71, 'One-way', 120.00, 'Paid', '2024-11-27 06:30:00'),
	(72, 72, 72, 'Round-trip', 155.00, 'Paid', '2024-11-27 07:00:00'),
	(73, 73, 73, 'Student', 60.00, 'Paid', '2024-11-27 07:45:00'),
	(74, 74, 74, 'One-way', 135.00, 'Paid', '2024-11-27 08:30:00'),
	(75, 75, 75, 'Round-trip', 145.00, 'Paid', '2024-11-27 09:00:00'),
	(76, 76, 76, 'One-way', 140.00, 'Paid', '2024-11-27 09:45:00'),
	(77, 77, 77, 'Round-trip', 160.00, 'Paid', '2024-11-27 10:30:00'),
	(78, 78, 78, 'Student', 65.00, 'Paid', '2024-11-27 11:00:00'),
	(79, 79, 79, 'One-way', 125.00, 'Paid', '2024-11-27 11:45:00'),
	(80, 80, 80, 'Round-trip', 150.00, 'Paid', '2024-11-27 12:15:00'),
	(81, 81, 81, 'One-way', 130.00, 'Paid', '2024-11-27 13:00:00'),
	(82, 82, 82, 'Round-trip', 155.00, 'Paid', '2024-11-27 13:30:00'),
	(83, 83, 83, 'Student', 55.00, 'Paid', '2024-11-27 14:00:00'),
	(84, 84, 84, 'One-way', 120.00, 'Paid', '2024-11-27 14:45:00'),
	(85, 85, 85, 'Round-trip', 145.00, 'Paid', '2024-11-27 15:30:00'),
	(86, 86, 86, 'One-way', 110.00, 'Paid', '2024-11-27 16:00:00'),
	(87, 87, 87, 'Round-trip', 160.00, 'Paid', '2024-11-27 16:45:00'),
	(88, 88, 88, 'Student', 50.00, 'Paid', '2024-11-27 17:15:00'),
	(89, 89, 89, 'One-way', 125.00, 'Paid', '2024-11-27 18:00:00'),
	(90, 90, 90, 'Round-trip', 150.00, 'Paid', '2024-11-27 18:45:00'),
	(91, 91, 91, 'One-way', 120.00, 'Paid', '2024-11-27 19:30:00'),
	(92, 92, 92, 'Round-trip', 155.00, 'Paid', '2024-11-27 20:00:00'),
	(93, 93, 93, 'Student', 60.00, 'Paid', '2024-11-27 20:45:00'),
	(94, 94, 94, 'One-way', 135.00, 'Paid', '2024-11-27 21:30:00'),
	(95, 95, 95, 'Round-trip', 145.00, 'Paid', '2024-11-27 22:00:00'),
	(96, 96, 96, 'One-way', 140.00, 'Paid', '2024-11-27 22:45:00'),
	(97, 97, 97, 'Round-trip', 160.00, 'Paid', '2024-11-27 23:30:00'),
	(98, 98, 98, 'Student', 65.00, 'Paid', '2024-11-28 00:00:00'),
	(99, 99, 99, 'One-way', 125.00, 'Paid', '2024-11-28 00:45:00'),
	(100, 100, 100, 'Round-trip', 150.00, 'Paid', '2024-11-28 01:30:00');



--Staf table

Insert into staff (staffid, fullname, role, stationid, trainid, startdate)
values
	(1, 'Ali Hossain', 'Driver', 1, 1, '2022-06-10'),
	(2, 'Mehedi Hasan', 'Conductor', 2, NULL, '2020-04-15'),
	(3, 'Amina Begum', 'Maintenance Worker', 3, NULL, '2019-03-05'),
	(4, 'Faruk Mia', 'Driver', 4, 4, '2021-02-25'),
	(5, 'Shilpi Sultana', 'Ticket Clerk', 5, NULL, '2023-01-01'), 
	(6, 'Rafiqul Islam', 'Driver', 1, 2, '2021-07-15'),
	(7, 'Monira Khatun', 'Conductor', 2, NULL, '2018-08-01'),
	(8, 'Jahangir Alam', 'Maintenance Worker', 3, NULL, '2020-12-10'),
	(9, 'Shahinur Rahman', 'Driver', 4, 5, '2022-09-20'),
	(10, 'Nusrat Jahan', 'Ticket Clerk', 5, NULL, '2021-05-30'),
	(11, 'Salahuddin Ahmed', 'Driver', 1, 3, '2019-02-10'),
	(12, 'Sonia Begum', 'Conductor', 2, NULL, '2022-03-25'),
	(13, 'Abdul Kader', 'Maintenance Worker', 3, NULL, '2021-04-10'),
	(14, 'Mizanur Rahman', 'Driver', 4, 6, '2020-05-18'),
	(15, 'Zulekha Sultana', 'Ticket Clerk', 5, NULL, '2019-09-15'),
	(16, 'Safiuddin Ahmed', 'Driver', 1, 7, '2021-11-01'),
	(17, 'Kazi Rina', 'Conductor', 2, NULL, '2020-10-17'),
	(18, 'Feroze Alam', 'Maintenance Worker', 3, NULL, '2022-01-30'),
	(19, 'Farida Yasmin', 'Driver', 4, 8, '2021-06-05'),
	(20, 'Rakibul Islam', 'Ticket Clerk', 5, NULL, '2023-02-22'),
	(21, 'Abul Bashar', 'Driver', 1, 9, '2018-12-12'),
	(22, 'Ayesha Akter', 'Conductor', 2, NULL, '2021-01-20'),
	(23, 'Zainab Khatoon', 'Maintenance Worker', 3, NULL, '2020-07-25'),
	(24, 'Shamsul Haque', 'Driver', 4, 10, '2022-04-10'),
	(25, 'Tahmina Sultana', 'Ticket Clerk', 5, NULL, '2022-05-16'),
	(26, 'Gazi Mohammed', 'Driver', 1, 11, '2019-08-18'),
	(27, 'Farhana Yasmin', 'Conductor', 2, NULL, '2023-03-11'),
	(28, 'Iqbal Hossain', 'Maintenance Worker', 3, NULL, '2021-08-10'),
	(29, 'Tanveer Islam', 'Driver', 4, 12, '2020-11-01'),
	(30, 'Moureen Begum', 'Ticket Clerk', 5, NULL, '2021-07-15'),
	(31, 'Ruhul Amin', 'Driver', 1, 13, '2022-06-20'),
	(32, 'Taslima Akter', 'Conductor', 2, NULL, '2021-04-01'),
	(33, 'Mizanur Jaman', 'Maintenance Worker', 3, NULL, '2020-09-25'),
	(34, 'Khalid Arefin', 'Driver', 4, 14, '2022-02-14'),
	(35, 'Shirin Akter', 'Ticket Clerk', 5, NULL, '2023-07-05'),
	(36, 'Shakil Hossain', 'Driver', 1, 15, '2023-02-11'),
	(37, 'Shahnaz Parvin', 'Conductor', 2, NULL, '2020-06-05'),
	(38, 'Anwar Hossain', 'Maintenance Worker', 3, NULL, '2021-03-13'),
	(39, 'Mohammad Zubair', 'Driver', 4, 16, '2020-10-25'),
	(40, 'Mitha Akter', 'Ticket Clerk', 5, NULL, '2022-09-08'),
	(41, 'Rifat Hossain', 'Driver', 1, 17, '2019-05-23'),
	(42, 'Saharun Nahar', 'Conductor', 2, NULL, '2021-08-12'),
	(43, 'Abdur Rahman', 'Maintenance Worker', 3, NULL, '2022-11-06'),
	(44, 'Nargis Parvin', 'Driver', 4, 18, '2023-03-17'),
	(45, 'Rukaiya Sultana', 'Ticket Clerk', 5, NULL, '2023-06-10'),
	(46, 'Kamal Uddin', 'Driver', 1, 19, '2021-01-28'),
	(47, 'Jannatul Naim', 'Conductor', 2, NULL, '2022-04-18'),
	(48, 'Mashiur Rahman', 'Maintenance Worker', 3, NULL, '2020-12-01'),
	(49, 'Nahidul Islam', 'Driver', 4, 20, '2021-09-09'),
	(50, 'Sakina Begum', 'Ticket Clerk', 5, NULL, '2020-08-23'),
	(51, 'Md. Khurshid Alam', 'Driver', 1, 21, '2022-05-01'),
	(52, 'Tariq Hossain', 'Conductor', 2, NULL, '2019-04-14'),
	(53, 'Hasina Begum', 'Maintenance Worker', 3, NULL, '2021-07-30'),
	(54, 'Shamsul Karim', 'Driver', 4, 22, '2023-01-12'),
	(55, 'Nusrat Sharmin', 'Ticket Clerk', 5, NULL, '2021-11-25'),
	(56, 'Fahim Hossain', 'Driver', 1, 23, '2020-03-22'),
	(57, 'Rashida Begum', 'Conductor', 2, NULL, '2018-09-10'),
	(58, 'Kazi Abdullah', 'Maintenance Worker', 3, NULL, '2022-02-05'),
	(59, 'Samira Parvin', 'Driver', 4, 24, '2021-11-18'),
	(60, 'Meherun Nahar', 'Ticket Clerk', 5, NULL, '2022-10-02'),
	(61, 'Mannan Sattar', 'Driver', 1, 25, '2019-05-30'),
	(62, 'Najma Sultana', 'Conductor', 2, NULL, '2020-12-12'),
	(63, 'Md. Rezaul Karim', 'Maintenance Worker', 3, NULL, '2021-06-15'),
	(64, 'Shakirul Islam', 'Driver', 4, 26, '2022-08-20'),
	(65, 'Rifa Khatun', 'Ticket Clerk', 5, NULL, '2021-01-22'),
	(66, 'Kader Sultana', 'Driver', 1, 27, '2023-03-01'),
	(67, 'Rina Akter', 'Conductor', 2, NULL, '2020-01-18'),
	(68, 'Tarek Sadiq', 'Maintenance Worker', 3, NULL, '2021-08-14'),
	(69, 'Anwar Hossain', 'Driver', 4, 28, '2021-04-22'),
	(70, 'Zainab Nasrin', 'Ticket Clerk', 5, NULL, '2020-07-08'),
	(71, 'Nusrat Jahan', 'Driver', 1, 29, '2022-01-11'),
	(72, 'Kamaluddin Hossain', 'Conductor', 2, NULL, '2022-10-05'),
	(73, 'Chandana Begum', 'Maintenance Worker', 3, NULL, '2020-04-01'),
	(74, 'Foysal Hossain', 'Driver', 4, 30, '2023-05-18'),
	(75, 'Afreen Ahmed', 'Ticket Clerk', 5, NULL, '2022-07-19'),
	(76, 'Salah Uddin', 'Driver', 1, 31, '2021-10-10'),
	(77, 'Fatema Begum', 'Conductor', 2, NULL, '2020-11-30'),
	(78, 'Kazi Rafique', 'Maintenance Worker', 3, NULL, '2022-06-17'),
	(79, 'Shahina Akter', 'Driver', 4, 32, '2022-03-21'),
	(80, 'Mirza Shabnam', 'Ticket Clerk', 5, NULL, '2023-04-12'),
	(81, 'Nasir Uddin', 'Driver', 1, 33, '2019-01-13'),
	(82, 'Salma Sultana', 'Conductor', 2, NULL, '2021-08-08'),
	(83, 'Mohammad Hafiz', 'Maintenance Worker', 3, NULL, '2020-03-25'),
	(84, 'Sabrina Islam', 'Driver', 4, 34, '2021-09-30'),
	(85, 'Arifa Parvin', 'Ticket Clerk', 5, NULL, '2021-12-10'),
	(86, 'Abdullah Al Mamun', 'Driver', 1, 35, '2022-05-24'),
	(87, 'Mim Atiya', 'Conductor', 2, NULL, '2022-02-15'),
	(88, 'Sama Sultana', 'Maintenance Worker', 3, NULL, '2021-11-29'),
	(89, 'Nadeem Sadiq', 'Driver', 4, 36, '2023-01-25'),
	(90, 'Parveen Yasmin', 'Ticket Clerk', 5, NULL, '2023-08-01'),
	(91, 'Mushfiqur Rahman', 'Driver', 1, 37, '2020-02-10'),
	(92, 'Shafiqah Noor', 'Conductor', 2, NULL, '2023-05-04'),
	(93, 'Rabiul Islam', 'Maintenance Worker', 3, NULL, '2022-10-22'),
	(94, 'Tawhida Akter', 'Driver', 4, 38, '2022-11-14'),
	(95, 'Nusrat Jahan', 'Ticket Clerk', 5, NULL, '2021-03-08'),
	(96, 'Mohammad Zubair', 'Driver', 1, 39, '2020-07-20'),
	(97, 'Shirin Akter', 'Conductor', 2, NULL, '2021-04-05'),
	(98, 'Abdul Motaleb', 'Maintenance Worker', 3, NULL, '2023-02-10'),
	(99, 'Kazi Shanta', 'Driver', 4, 40, '2021-12-02'),
	(100, 'Sazia Akter', 'Ticket Clerk', 5, NULL, '2022-05-05');

--7. Maintenance Records Table

Insert into maintenancerecords (maintenanceid, trainid, maintenancetype, maintenancedate, duration, status) 
values
	(1, 1, 'Preventive', '2024-11-20 09:00:00', 3, 'Completed'),
	(2, 2, 'Corrective', '2024-11-22 11:00:00', 5, 'In-Progress'),
	(3, 3, 'Preventive', '2024-11-18 08:30:00', 2, 'Completed'),
	(4, 4, 'Corrective', '2024-11-23 14:00:00', 4, 'Completed'),
	(5, 5, 'Preventive', '2024-11-19 10:00:00', 3, 'Completed'),
	(6, 1, 'Preventive', '2024-11-24 07:30:00', 4, 'Completed'),
	(7, 2, 'Corrective', '2024-11-25 13:00:00', 6, 'In-Progress'),
	(8, 3, 'Preventive', '2024-11-21 09:15:00', 3, 'Completed'),
	(9, 4, 'Corrective', '2024-11-20 14:00:00', 2, 'Completed'),
	(10, 5, 'Preventive', '2024-11-18 11:00:00', 5, 'Completed'),
	(11, 1, 'Corrective', '2024-11-17 08:30:00', 4, 'In-Progress'),
	(12, 2, 'Preventive', '2024-11-16 07:00:00', 2, 'Completed'),
	(13, 3, 'Corrective', '2024-11-15 10:45:00', 3, 'Completed'),
	(14, 4, 'Preventive', '2024-11-14 12:30:00', 6, 'Completed'),
	(15, 5, 'Corrective', '2024-11-13 15:00:00', 4, 'In-Progress'),
	(16, 1, 'Preventive', '2024-11-12 09:30:00', 3, 'Completed'),
	(17, 2, 'Corrective', '2024-11-11 10:00:00', 5, 'Completed'),
	(18, 3, 'Preventive', '2024-11-10 08:30:00', 2, 'In-Progress'),
	(19, 4, 'Corrective', '2024-11-09 11:00:00', 4, 'Completed'),
	(20, 5, 'Preventive', '2024-11-08 13:30:00', 3, 'Completed');



--8. Operations Table

Insert Into operations (operationid, trainid, operationdate, departurestationid, arrivalstationid, status) 
 values
	(1, 1, '2024-11-26 06:00:00', 1, 2, 'On-time'),
	(2, 2, '2024-11-26 08:00:00', 2, 3, 'Delayed'),
	(3, 3, '2024-11-26 07:30:00', 3, 4, 'On-time'),
	(4, 4, '2024-11-26 10:00:00', 4, 5, 'Cancelled'),
	(5, 5, '2024-11-26 11:30:00', 5, 1, 'On-time'),
	(6, 1, '2024-11-27 06:30:00', 1, 2, 'On-time'),
	(7, 2, '2024-11-27 08:30:00', 2, 3, 'Delayed'),
	(8, 3, '2024-11-27 07:45:00', 3, 4, 'On-time'),
	(9, 4, '2024-11-27 10:30:00', 4, 5, 'Cancelled'),
	(10, 5, '2024-11-27 12:00:00', 5, 1, 'On-time'),
	(11, 1, '2024-11-28 06:00:00', 1, 2, 'Delayed'),
	(12, 2, '2024-11-28 08:00:00', 2, 3, 'On-time'),
	(13, 3, '2024-11-28 07:15:00', 3, 4, 'On-time'),
	(14, 4, '2024-11-28 09:30:00', 4, 5, 'Cancelled'),
	(15, 5, '2024-11-28 11:00:00', 5, 1, 'On-time'),
	(16, 1, '2024-11-29 06:00:00', 1, 2, 'On-time'),
	(17, 2, '2024-11-29 08:00:00', 2, 3, 'Delayed'),
	(18, 3, '2024-11-29 07:00:00', 3, 4, 'On-time'),
	(19, 4, '2024-11-29 10:30:00', 4, 5, 'Cancelled'),
	(20, 5, '2024-11-29 11:45:00', 5, 1, 'On-time');



