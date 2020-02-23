use dreamhome;
insert into Branch VALUES('B5', '22 Deer Rd', 'Sidcup', 'London', 'SW1 4EH', '0171-886-1212', '0171-886-1214');
insert into Branch VALUES('B7', '16 Argyll St', 'Dyce', 'Aberdeen', 'AB2 3SU', '01224-67125', '01224-67111');
insert into Branch VALUES('B3', '163 Main St' , 'Patrick', 'Glasgow', 'G11 9QX', '0141-339-2178', '0141-339-4439');
insert into Branch VALUES('B4', '32 Manse Rd', 'Leigh', 'Bristol', 'BS99 1NZ', '0117-916-1170', '0117-776-1114');
insert into Branch VALUES('B2', '56 Clover Dr', NULL, 'London', 'NW10 6EU', '0181-963-1030', '0181-453-7992');

insert into Owner VALUES('CO46', 'Joe', 'Keogh','2 Fergus Dr, Banchory, Aberdeen AB2 7SX', '01224-861212');
insert into Owner VALUES('CO87', 'Carol', 'Farrel','6 Achray St, Glasgow G32 9DX', '0141-357-7419');
insert into Owner VALUES('CO40', 'Tina', 'Murphy','63 Well St, Shawlands, Glasgow G42', '0141-943-1728');
insert into Owner VALUES('CO93', 'Tony', 'Shaw','12 Park Pl, Hillhead, Glasgow G4 0QR', '0141-225-7025');

insert into Property_For_Rent VALUES('PA14','16 Holhead','Dee','Aberdeen','AB7 5SU','House',6,650,'CO46','SA9','B7');
insert into Property_For_Rent VALUES('PL94','6 Argyll St','Kilburn','London','NW2','Flat',4,400,'CO87','SL41','B5');
insert into Property_For_Rent VALUES('PG4','6 Lawrence St','Patrick','Glasgow','G11 9QX','Flat',3,350,'CO40','SG14','B3');
insert into Property_For_Rent VALUES('PG36','2 Manor Rd',NULL,'Glasgow','G32 4QX','Flat',3,375,'CO93','SG37','B3');
insert into Property_For_Rent VALUES('PG21','18 Dale Rd','Hyndland','Glasgow','G12','House',5,600,'CO87','SG37','B3');
insert into Property_For_Rent VALUES('PG16','5 Novar Dr','Hyndland','Glasgow','G12 9AX','Flat',4,450,'CO93','SG14','B3');

insert into Renter VALUES('CR76', 'John', 'Kay','56 High St, Putney, London SW1 4EH', '0171-774-5632', 'Flat',425);
insert into Renter VALUES('CR56', 'Aline', 'Steward','64 Fern Dr, Pollock, Glasgow G42 0Bl', '0141-848-1825', 'Flat',350);
insert into Renter VALUES('CR74', 'Mike', 'Ritchie','18 Tain St, Gourock PA1G 1YQ', '01475-392178', 'House',750);
insert into Renter VALUES('CR62', 'Mary', 'Tregear','5 Tarbot Rd,Kildary, Aberdeen AB9 3ST', '01224-196720', 'Flat',600);

insert into Staff VALUES('SL21', 'John', 'White','19 Taylor St, Cranford, London', '1-884-5112', 'Manager', 'M', '1-Oct-45', 300000, 'WK442011B', 'B5');
insert into Staff VALUES('SG37', 'Ann', 'Beech','81 George St, Glasgow PA1 2JR', '1-848-3345', 'Snr Asst', 'F', '10-Nov-60',12000, 'WL432514C', 'B3');
insert into Staff VALUES('SG14', 'David', 'Ford','63 Ashby St, Patrick Glasgow G11', '1-339-2177', 'Deputy', 'M', '24-Mar-58',18000, 'WL220658D', 'B3');
insert into Staff VALUES('SA9', 'Mary', 'Howe','2 Elm Pl, Aberdeen AB2 3SU', NULL, 'Assistant', 'F', '19-Feb-70',9000, 'WM532187D', 'B7');
insert into Staff VALUES('SG5', 'Susan', 'Brand','5 Gt Western Rd, Glasgow G12', '1-334-2001', 'Manager', 'F', '3-Jun-40',24000, 'WK588932E', 'B3');
insert into Staff VALUES('SL41', 'Julie', 'Lee','28 Malvern St, Kilburn NW2', '1-554-3541', 'Assistant', 'F', '13-Jun-65',9000, 'WA290573K', 'B5');

insert into Viewing VALUES('CR56','PA14', '24-May-95', 'too small');
insert into Viewing VALUES('CR76','PG4', '20-Apr-95', 'too remote');
insert into Viewing VALUES('CR56','PG4', '26-May-95', NULL);
insert into Viewing VALUES('CR62','PA14', '14-May-95', 'no dining room');
insert into Viewing VALUES('CR56','PG36', '28-Apr-95', NULL);

