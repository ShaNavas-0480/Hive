use niit;

add jar /home/hduser/hive.jar;

create temporary function userdate as 'hive.UnixtimeToDate';

select id, userdate(unixtime) from testing;
