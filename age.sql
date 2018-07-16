set myage = 45;
select * from retail.customer where age >= ${hiveconf:myage};
