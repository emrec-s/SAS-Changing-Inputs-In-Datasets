/*About PROC SQL*/

/* Proc SQL is one of the tools that is used in SAS. 

It is easy to use and understand the SAS if you know SQL even if you don't know the fundemantal of SAS programming. 

Also sometimes it is better to use sql rather 
than SAS and there is not a big difference of the process time between SAS and SQL codes. If the code is designed well it will work well.*/ 

/*Let's assume that there are two datasets: coffee_order, coffe_cost, and coffe_supply. These datasets should be collected from a coffe shop. */

/*That is why firsty we should review the data. You can download it from the project. */

/*SAS is one of the easiest tools that manipulates the dataset by using tables.*/

/*Here a input table for manipulating:         */







/*Then we use this table to change values*/

%macro apply_change_value;

/*This part creates a parameter to use in our SQL code.*/

	PROC SQL;

	select change_value into:parmeter
	from parameter_table
	where ID.parameter_table="V01";

	QUIT;

	/*Another way to create a parameter is shown in below.*/

	data _null_;
	    set parameter_table;
		call symputx('parmeter',change_value,"g");
	run;


	/*Then we can easily change our datasets with the parameter that we assigned.*/  

	PROC SQL;

	create table costs_of_orders as
	select order.*, cost.*, (usage_amount.order/amount.cost)*price.order as cost_of_order
	from coffee_order order
	left join coffe_cost cost on order.coffe_type=cost.coffe_type;

	QUIT; 

%mend apply_change_value;

/*Because we wrote a macro thus we have to call it to use it.*/

%apply_change_value;





