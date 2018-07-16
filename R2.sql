use retail;

drop table retail.out1;
drop table retail.out2;

create table retail.out1 (custno int,firstname string,age int,profession string,amount double,product string)
row format delimited                                                                                  
fields terminated by ',';   


insert overwrite table retail.out1                                                                           
select a.custno,a.firstname,a.age,a.profession,b.amount,b.product                                     
from retail.customer a JOIN retail.txnrecords b ON a.custno = b.custno;     

--select * from out1 limit 100;

create table retail.out2 (custno int,firstname string,age int,profession string,amount double,product string, level string)
row format delimited                                                                                  
fields terminated by ' ';   

insert overwrite table retail.out2
select * , case when age<30 then 'low' when age>=30 and age < 50 then 'middle' when age>=50 then 'old' 
else 'others' end
from out1;


--select * from out2; 

select a.level, round(sum(a.amount),2) as totalspent, round((sum(a.amount)/total*100),2) as salespercent  from retail.out2 a, retail.totalsales b group by a.level, b.total;




