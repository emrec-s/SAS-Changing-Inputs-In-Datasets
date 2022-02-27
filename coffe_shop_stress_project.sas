/*About PROC SQL*/

/*Firsty Proc SQL is one of the tools that is used in SAS. It is realy easy to use and understand the SAS even if you don't know the fundemantal of SAS programming. Also sometimes it is better to use sql rather than SAS and there is not a big difference of the process time between SAS and SQL codes. If the code is designed well it will work well.*/ 

/*Let's assume that there are two datasets: coffee_order, coffe_cost, and coffe_supply. These datasets should be collected from a coffe shop. */

/*That is why firsty we should review the data. You can download it from the project. */

PROC SQL;

select change_value into:parmeter
from parameter_table
where ID.parameter_table="V01";

QUIT;


PROC SQL;

create table costs_of_orders as
select order.*, cost.*, (usage_amount.order/amount.cost)*price.order as cost_of_order
from coffee_order order
left join coffe_cost cost on order.coffe_type=cost.coffe_type;

QUIT; 







