
create table sales_bonus (
sales_id int primary key,
sales_person varchar (30),
department varchar (30),
amount_sold int
);

insert into sales_bonus value (1,'sola sobowale', 'sales', 23000);
insert into sales_bonus value (2,'yinka quadri', 'marketing', 45000);
insert into sales_bonus value (3,'abass usman', 'finance', 5000);
insert into sales_bonus value (4,'idris elba', 'marketing', 65000);
insert into sales_bonus value (5,'yunus ilyas', 'sales', 34900);
insert into sales_bonus value (6,'ali muhammmed', 'finance', 67000);
insert into sales_bonus value (7,'anu Oluwa', 'finance', 10500);
insert into sales_bonus value (8,'Bolu Sule', 'sales', 78000);

-- the top two highest paid employees in each department
select * 

from (
select *, 
max(amount_sold) over ( partition by department order by amount_sold desc) as max_sales,
row_number() over(partition by department) as row_nnum
from sales_bonus
) x

where x.row_nnum < 3 ;



-- to calculate those that will get bonus from those that won't
select * ,
case 
when amount_sold >50000
then amount_sold + 5000 else 'no bonus'
end as bonus_sales
from sales_bonus
order by sales_id
;

