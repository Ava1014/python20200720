create database books character set utf8;

use books;

create table book (
id int primary key auto_increment,
book_name varchar(50) not null,
author varchar(30),
press varchar(50),
price decimal(5,2) unsigned,
remark text);

insert into book values
(1,"人间失格","太宰治","作家出版社",41.20,"日本小说家太宰治的自传体小说，李现推荐"),
(2,"你当像鸟飞往你的山","塔拉 · 韦斯特弗","南海出版公司",59.50,"比尔·盖茨年度特别推荐"),
(3,"云边有个小卖部","张嘉佳","湖南文艺出版社",58.90,"随书附赠云边镇四季明信片和张嘉佳作词单曲彩蛋"),
(4,"乌合之众 : 大众心理研究","古斯塔夫·勒庞","民主与建设出版社",41.70,"被希特勒利用，影响罗斯福、戴高乐等政要，三次遭禁");

insert into book (book_name,author,press,price,remark) values
("神奇校车·桥梁书版","乔安娜柯尔","贵州人民出版社",105,"当当童书畅销榜排名1位"),
(" 坏小孩","紫金陈","湖南文艺出版社",62.40,"《隐秘的角落》原著小说"),
("马尔克斯：百年孤独","加西亚·马尔克斯","南海出版公司",68,"马尔克斯代表作"),
("人生海海","麦家","北京十月文艺出版社",57.50,"麦家重磅新作");

insert into book
(book_name,author,press,price,remark)
values
("边城","沈从文","机械工业出版社",36,"小城故事多"),
("骆驼祥子","老舍","机械工业出版社",43,"你是祥子么？"),
("茶馆","老舍","中国文学出版社",55,"老北京"),
("呐喊","鲁迅","人民教育出版社",72,"最后的声音"),
("朝花夕拾","鲁迅","中国文学出版社",53,"好时光"),
("围城","钱钟书","中国文学出版社",44,"你心中的围城是什么");

insert into book
(book_name,author,press,price)
values
("林家铺子",'茅盾','机械工业出版社',51),
("冰心全集",'冰心','人民教育出版社',47);


select * from book where author="老舍" and press="中国文学出版社";
select book_name,price from book where price>60;
select * from book where author in ("鲁迅","茅盾");


update book set price=45 where book_name='呐喊';
alter table book add public_time date after price;
update book set public_time="2018-10-01" where author='老舍';
update book set public_time="2020-1-1" where press="中国文学出版社" and author!='老舍';
update book set public_time="2019-10-01" where public_time is null;
delete from book where price>65;

select author,avg(price) from book
group by author;

select press,count(price) from book
group by press;

select public_time,avg(price) from book
group by public_time;


"""
day08 作业
“”“

create table book_new (
id int primary key auto_increment,
book_name varchar(50) not null,
author_id int,
press_id int,
price decimal(5,2) unsigned,
remark text,
foreign key (author_id) references author(aid),
foreign key (press_id) references press(pid)
);

create table author (
aid int primary key auto_increment,
aname varchar(30)
);

create table press (
pid int primary key auto_increment,
pname varchar(50)
);

insert into book_new
(book_name,author_id,press_id,price,remark)
values
("边城",1,1,36,"小城故事多"),
("骆驼祥子",2,1,43,"你是祥子么？"),
("茶馆",2,2,55,"老北京"),
("呐喊",3,3,72,"最后的声音"),
("朝花夕拾",3,2,53,"好时光"),
("围城",4,2,44,"你心中的围城是什么");

insert into book_new
(book_name,author_id,press_id,price)
values
("林家铺子",5,1,51),
("冰心全集",6,3,47);

insert into author values
(1,"沈从文"),
(2,"老舍"),
(3,"鲁迅"),
(4,"钱钟书"),
(5,"茅盾"),
(6,"冰心");

insert into press values
(1,"机械工业出版社"),
(2,"中国文学出版社"),
(3,"人民教育出版社");

