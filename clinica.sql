create database clinica

CREATE TABLE paciente (
    id Serial NOT NULL,
    last_name varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    age int,
    PRIMARY KEY (id)
);

CREATE TABLE clinicadata (
    id serial NOT NULL,
    paciente_id int,
    component_name varchar(255) NOT NULL,
    component_value varchar(255) NOT NULL,
    measured_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
     CONSTRAINT fk_paciente FOREIGN KEY (paciente_id)
  REFERENCES paciente(id)
);


insert into paciente values(1,'John','Mccain',52);
insert into paciente values(2,'Siva','Shankar',32);
insert into paciente values(3,'Anthony','Simon',22);
insert into paciente values(4,'Bruce','Sanhurst',33);
insert into paciente values(5,'Abhram','Mani',55);
insert into paciente values(6,'Gandhi','Singh',12);
insert into paciente values(7,'Antti','Krovinan',27);
insert into paciente values(8,'Simba','White',24);
insert into paciente values(9,'Rose','Tanic',29);
insert into paciente values(10,'Rowling','Lte',49);



insert into clinicadata  values('1', '1', 'bp', '67/119', '2018-07-09 19:34:24')
insert into clinicadata  values('2', '2', 'bp', '63/115', '2018-06-19 19:34:24')	
insert into clinicadata  values('3', '3', 'bp', '72/129', '2018-07-26 19:34:24')
insert into clinicadata  values('4', '4', 'bp', '74/139', '2018-08-03 19:34:24');
insert into clinicadata  values('5', '5', 'bp', '67/119', '2018-08-29 19:34:24');
insert into clinicadata  values('6', '6', 'bp', '62/109', '2018-07-12 19:34:24');
insert into clinicadata  values('7', '7', 'bp', '55/102', '2018-06-13 19:34:24');
insert into clinicadata  values('8', '8', 'bp', '47/90', '2018-08-02 19:34:24');
insert into clinicadata  values('9', '9', 'bp', '90/149', '2018-06-01 19:34:24');
insert into clinicadata  values('10', '10', 'bp', '50/109', '2018-07-09 19:34:24');
insert into clinicadata  values('11', '1', 'bp', '55/102', '2018-11-02 19:34:24');
insert into clinicadata  values('12', '2', 'bp', '67/119', '2018-08-09 19:34:24');
insert into clinicadata  values('13', '3', 'bp', '63/115', '2018-09-09 19:34:24');
insert into clinicadata  values('14', '4', 'bp', '55/102', '2018-09-13 19:34:24');
insert into clinicadata  values('15', '5', 'bp', '50/109', '2018-10-12 19:34:24');
insert into clinicadata  values('16', '6', 'bp', '67/119', '2018-11-29 19:34:24');
insert into clinicadata  values('17', '7', 'bp', '63/115', '2018-11-03 19:34:24');
insert into clinicadata  values('18', '8', 'bp', '63/115', '2018-10-26 19:34:24');
insert into clinicadata  values('19', '9', 'bp', '55/102', '2018-09-11 19:34:24');
insert into clinicadata  values('20', '10', 'bp', '72/129', '2018-09-29 19:34:24');
insert into clinicadata  values('21', '1', 'bp', '55/102', '2018-10-09 19:34:24');
insert into clinicadata  values('22', '2', 'bp', '63/115', '2018-10-20 19:34:24');
insert into clinicadata  values('23', '3', 'bp', '55/102', '2018-11-19 19:34:24');
insert into clinicadata  values('24', '5', 'bp', '72/129', '2018-12-30 19:34:24');
insert into clinicadata  values('25', '6', 'bp', '63/115', '2018-10-21 19:34:24');
insert into clinicadata  values('26', '7', 'bp', '47/90', '2018-12-29 19:34:24');
insert into clinicadata  values('27', '8', 'bp', '63/115', '2018-11-08 19:34:24');
insert into clinicadata  values('28', '9', 'bp', '90/149', '2018-10-03 19:34:24');
insert into clinicadata  values('29', '10', 'bp', '55/102', '2018-10-29 19:34:24');
insert into clinicadata  values('30', '1', 'bp', '90/149', '2018-03-19 19:34:24');
insert into clinicadata  values('31', '2', 'bp', '55/102', '2018-04-03 19:34:24');
insert into clinicadata  values('32', '3', 'bp', '63/115', '2018-05-21 19:34:24');
insert into clinicadata  values('33', '4', 'bp', '47/90', '2018-03-31 19:34:24');
insert into clinicadata  values('34', '5', 'bp', '55/102', '2018-04-19 19:34:24');
insert into clinicadata  values('35', '6', 'bp', '72/129', '2018-04-28 19:34:24');
insert into clinicadata  values('36', '7', 'bp', '67/119', '2018-03-19 19:34:24');
insert into clinicadata  values('37', '8', 'bp', '50/109', '2018-05-21 19:34:24');
insert into clinicadata  values('38', '9', 'bp', '67/119', '2018-04-12 19:34:24');
insert into clinicadata  values('39', '10', 'bp', '67/119', '2018-03-19 19:34:24');
insert into clinicadata  values('40', '1', 'bp', '67/119', '2019-06-09 19:34:24');
insert into clinicadata  values('41', '2', 'bp', '55/102', '2019-05-23 19:34:24');
insert into clinicadata  values('42', '3', 'bp', '67/119', '2019-06-01 19:34:24');
insert into clinicadata  values('43', '4', 'bp', '90/149', '2019-03-01 19:34:24');
insert into clinicadata  values('44', '5', 'bp', '55/102', '2019-01-06 19:34:24');
insert into clinicadata  values('45', '6', 'bp', '67/119', '2019-03-29 19:34:24');
insert into clinicadata  values('46', '7', 'bp', '55/102', '2019-02-21 19:34:24');
insert into clinicadata  values('47', '8', 'bp', '50/109', '2019-02-15 19:34:24');
insert into clinicadata  values('48', '9', 'bp', '67/119', '2019-04-19 19:34:24');
insert into clinicadata  values('49', '10', 'bp', '37/89', '2019-05-29 19:34:24');

insert into clinicadata  values('51', '1', 'heartrate', '67', '2018-07-09 19:34:24');
insert into clinicadata  values('52', '2', 'heartrate', '115', '2018-06-19 19:34:24');	
insert into clinicadata  values('53', '3', 'heartrate', '72', '2018-07-26 19:34:24');
insert into clinicadata  values('54', '4', 'heartrate', '74', '2018-08-03 19:34:24');
insert into clinicadata  values('55', '5', 'heartrate', '119', '2018-08-29 19:34:24');
insert into clinicadata  values('56', '6', 'heartrate', '62', '2018-07-12 19:34:24');
insert into clinicadata  values('57', '7', 'heartrate', '102', '2018-06-13 19:34:24');
insert into clinicadata  values('58', '8', 'heartrate', '90', '2018-08-02 19:34:24');
insert into clinicadata  values('59', '9', 'heartrate', '90', '2018-06-01 19:34:24');
insert into clinicadata  values('50', '10', 'heartrate', '109', '2018-07-09 19:34:24');
insert into clinicadata  values('61', '1', 'heartrate', '55', '2018-11-02 19:34:24');
insert into clinicadata  values('62', '2', 'heartrate', '67', '2018-08-09 19:34:24');
insert into clinicadata  values('63', '3', 'heartrate', '63', '2018-09-09 19:34:24');
insert into clinicadata  values('64', '4', 'heartrate', '55', '2018-09-13 19:34:24');
insert into clinicadata  values('65', '5', 'heartrate', '50', '2018-10-12 19:34:24');
insert into clinicadata  values('66', '6', 'heartrate', '119', '2018-11-29 19:34:24');
insert into clinicadata  values('67', '7', 'heartrate', '115', '2018-11-03 19:34:24');
insert into clinicadata  values('68', '8', 'heartrate', '63', '2018-10-26 19:34:24');
insert into clinicadata  values('69', '9', 'heartrate', '55', '2018-09-11 19:34:24');
insert into clinicadata  values('60', '10', 'heartrate', '72', '2018-09-29 19:34:24');
insert into clinicadata  values('71', '1', 'heartrate', '55', '2018-10-09 19:34:24');
insert into clinicadata  values('72', '2', 'heartrate', '115', '2018-10-20 19:34:24');
insert into clinicadata  values('73', '3', 'heartrate', '55', '2018-11-19 19:34:24');
insert into clinicadata  values('74', '5', 'heartrate', '129', '2018-12-30 19:34:24');
insert into clinicadata  values('75', '6', 'heartrate', '63', '2018-10-21 19:34:24');
insert into clinicadata  values('76', '7', 'heartrate', '90', '2018-12-29 19:34:24');
insert into clinicadata  values('77', '8', 'heartrate', '63', '2018-11-08 19:34:24');
insert into clinicadata  values('78', '9', 'heartrate', '149', '2018-10-03 19:34:24');
insert into clinicadata  values('79', '10', 'heartrate', '55', '2018-10-29 19:34:24');
insert into clinicadata  values('70', '1', 'heartrate', '149', '2018-03-19 19:34:24');
insert into clinicadata  values('81', '2', 'heartrate', '55', '2018-04-03 19:34:24');
insert into clinicadata  values('82', '3', 'heartrate', '115', '2018-05-21 19:34:24');
insert into clinicadata  values('83', '4', 'heartrate', '47', '2018-03-31 19:34:24');
insert into clinicadata  values('84', '5', 'heartrate', '102', '2018-04-19 19:34:24');
insert into clinicadata  values('85', '6', 'heartrate', '72', '2018-04-28 19:34:24');
insert into clinicadata  values('86', '7', 'heartrate', '67', '2018-03-19 19:34:24');
insert into clinicadata  values('87', '8', 'heartrate', '109', '2018-05-21 19:34:24');
insert into clinicadata  values('88', '9', 'heartrate', '67', '2018-04-12 19:34:24');
insert into clinicadata  values('89', '10', 'heartrate', '119', '2018-03-19 19:34:24');
insert into clinicadata  values('80', '1', 'heartrate', '119', '2019-06-09 19:34:24');
insert into clinicadata  values('91', '2', 'heartrate', '55/102', '2019-05-23 19:34:24');
insert into clinicadata  values('92', '3', 'heartrate', '67', '2019-06-01 19:34:24');
insert into clinicadata  values('93', '4', 'heartrate', '149', '2019-03-01 19:34:24');
insert into clinicadata  values('94', '5', 'heartrate', '102', '2019-01-06 19:34:24');
insert into clinicadata  values('95', '6', 'heartrate', '67/119', '2019-03-29 19:34:24');
insert into clinicadata  values('96', '7', 'heartrate', '55', '2019-02-21 19:34:24');
insert into clinicadata  values('97', '8', 'heartrate', '50', '2019-02-15 19:34:24');
insert into clinicadata  values('98', '9', 'heartrate', '67', '2019-04-19 19:34:24');
insert into clinicadata  values('99', '10', 'heartrate', '89', '2019-05-29 19:34:24');

drop table clinicadata

drop table paciente
