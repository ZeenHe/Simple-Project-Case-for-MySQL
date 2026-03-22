  -- 创建公司管理 数据库
  create database `Bussiness_Manage`
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;  -- 建库时指定字符集
  use `Bussiness_Manage`;
  SET NAMES utf8mb4;   -- 确保连接使用utf8mb4
  
  -- 创建公司资料库表格
  CREATE TABLE `employee`(
	`emp_id` INT PRIMARY KEY,
	`name` VARCHAR(20),
    `birth_date` DATE,
    `sex` VARCHAR(1),
    `salary` INT,
    `branch_id` INT,
    `sup_id` INT
)DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 创建公司分支表格
create table `branch`(
	`branch_id` int primary key,
    `branch_name` varchar(20),
    `manager_id` int,
    foreign key (`manager_id`) references `employee`(`emp_id`) on delete set null
)DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 为前面列表 添加foreign key
alter table `employee`
add foreign key(`branch_id`)
references `branch`(`branch_id`)
on delete set null;
  
alter table `employee`
add foreign key(`sup_id`)
references `employee`(`emp_id`)
on delete set null;
  
-- 创建公司客户表格
create table `client`(
	`client_id` int primary key,
    `client_name` varchar(20),
    `phone` varchar(20)
)DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 创建公司的工作关系
create table `works_with`(
	`emp_id` int,
    `client_id` int,
    `total_sales` int,
    primary key (`emp_id`,`client_id`),
    foreign key (`emp_id`) references `employee` (`emp_id`) on delete cascade,
    foreign key (`client_id`) references `client` (`client_id`) on delete cascade
)DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 添加公司资料信息（注意从部分写向总体，可以先用null代替关联部分，后面再补充）
insert into `branch` values(1,"研发",null);
insert into `branch` values(2,"行政",null);
insert into `branch` values(3,"资讯",null);

insert into `employee` values(206,"小黄",'2000-10-08',"F",50000,1,null);
insert into `employee` values(207,"小绿",'2001-11-18',"M",28000,2,206);
insert into `employee` values(208,"小蓝",'2005-05-30',"M",45000,3,206);
insert into `employee` values(209,"小紫",'2003-12-08',"F",37000,3,207);
insert into `employee` values(210,"小白",'2004-07-28',"F",66000,1,207);

-- 更新一下数据
update `branch`
set `manager_id` = 206
where `branch_id` = 1;

update `branch`
set `manager_id` = 207
where `branch_id` = 2;

update `branch`
set `manager_id` = 208
where `branch_id` = 3;

-- 继续导入具体信息
insert into `client` values(400,"小狗",'254354335');
insert into `client` values(401,"小猫",'256354363');
insert into `client` values(402,"小猪",'254355375');
insert into `client` values(403,"小鼠",'254355375');
insert into `client` values(404,"小鸭",'254357688');

insert into `works_with` values(206,400,'70000');
insert into `works_with` values(207,401,'24000');
insert into `works_with` values(208,402,'9800');
insert into `works_with` values(208,403,'24000');
insert into `works_with` values(210,404,'87940');

-- 以上为基本的设置环节
-- 下面是一些基本使用操作

-- 1.取得所有员工资料
use `Bussiness_Manage`;      -- 首次运行时需要选中某一个数据库
select * from `employee`;
-- 2.取得所有的客户资料
use `Bussiness_Manage`; 
select * from `employee`;
-- 3.按薪水从高到低取得员工资料
select * from `employee` order by `salary`;
-- 4.取得薪水前3高的员工
select * from `employee` 
order by `salary` desc
limit 3;
-- 5.取得所有员工的名字
select `name` from `employee`;



    
  
  
  
  
  
  
  
  