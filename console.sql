create database tour_manager;
use tour_manager;
# travel_destinations:dia dien den
create table  travel_destinations(
    id int auto_increment primary key ,
    destination_name varchar(100) not null ,
    describe_destination varchar(255),
    average_price double not null ,
    city_id int not null ,
    foreign key (city_id) references city(id)
);
create table city(
    id int auto_increment primary key ,
    city_name varchar(200)
);
create table customer_order_tour(
    id int auto_increment primary key ,
    customer_name varchar(100) not null ,
    identification_number varchar(50) unique ,
    year_of_birth year(4),
    city_id int not null ,
    foreign key (city_id) references city(id)

);
create table tour(
    id int auto_increment primary key ,
    tour_code varchar(50) unique ,
    tour_type_id int not null ,
    travel_destination_price double,
    start_day_id date,
    end_day date,
    foreign key (tour_type_id)references tour_type(id)

);
create table tour_type(
    id int auto_increment primary key ,
    type_code varchar(50) unique ,
    type_name varchar(100)


);
create table tour_order_invoice(
    tour_id int auto_increment primary key ,
    customer_id int not null ,
    status varchar(255),
    foreign key (customer_id) references customer_order_tour(id),
    foreign key (tour_id) references tour(id)
);
insert into city values(1,'HA Noi'),
                       (2,'Nam Dinh'),(3,'HA Noi'),
                       (4,'Thai Binh'),(5,'HA Noi');

insert into customer_order_tour values(1,'Loi',1234,1993,1),
                                      (2,'My',12345,1993,5),
                                      (3,'Nhi',12346,1993,3),
                                      (4,'Duong',12347,1993,2),
                                      (5,'Cong',123412,1993,5),
                                      (6,'Kien',123445,1993,4),
                                      (7,'dao',123409,1993,1),
                                      (8,'Dam',123476,1993,2),
                                      (9,'Mai',123499,1993,4),
                                      (10,'Canh',123422,1993,3);

insert into tour values
(1,'T1',1,1000,'2020-03-01','2020-04-01'),
(2,'T2',1,1000,'2020-03-12','2020-04-21'),
(3,'T3',1,1000,'2020-03-05','2020-03-30'),
(4,'T4',1,1000,'2020-04-01','2020-05-01'),
(5,'T5',1,1000,'2020-03-07','2020-05-01'),
(6,'T6',1,1000,'2020-04-11','2020-06-01'),
(7,'T7',1,1000,'2020-05-23','2020-06-30'),
(8,'T8',1,1000,'2020-02-09','2020-03-01'),
(9,'T9',1,1000,'2020-02-01','2020-04-01'),
(10,'T10',1,1000,'2020-03-25','2020-04-20'),
(11,'T11',1,1000,'2020-03-13','2020-04-09'),
(12,'T12',1,1000,'2020-04-14','2020-04-19'),
(13,'T13',1,1000,'2020-03-23','2020-04-24'),
(14,'T14',1,1000,'2020-03-04','2020-04-04'),
(15,'T15',1,1000,'2020-03-22','2020-04-15');

insert into tour_type values
(1,'A1','Hang 1'),(2,'A2','Hang 2');

insert into tour_order_invoice values (1,1,'Con Cho'),
                             (2,2,'Het Cho'),
                             (3,3,'Het Cho'),
                             (5,4,'Con Cho'),
                             (7,5,'Con Cho'),
                             (8,6,'Het Cho'),
                             (11,7,'Con Cho'),
                             (13,8,'Het Cho'),
                             (15,9,'Het Cho'),
                             (4,10,'Con Cho');

insert into travel_destinations values(1,'Pho Co','Dien du lich',500,1),
                                      (2,'Ho Hoan Kiem','Dien du lich',600,2),
                                      (3,'Ho Tay','Dien du lich',700,3),
                                      (4,'Trang An','Dien du lich',800,4),
                                      (5,'Pho Co Hoi An','Dien du lich',900,5);

select city_name , count(city_name)'number of tour' from  tour
join  tour_order_invoice toi on tour.id = toi.tour_id
join  customer_order_tour cot on toi.customer_id = cot.id
join city c on cot.city_id = c.id group by city_name;

select count( start_day_id )'Number of tour begin in 03-2020' from tour where start_day_id >= '2020-03-01' and start_day_id <='2020-03-31';
 select count( end_day)'Number of tour end in 04-2020' from tour where  end_day>='2020-04-01' and start_day_id <='2020-04-30';