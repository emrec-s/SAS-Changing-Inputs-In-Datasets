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



* Step 1: Create the dataset;



data coffee_order;
    input order_id coffe_type $ usage_amount price;
    datalines;
1 Espresso 10 2.5
2 Latte 5 3.5
3 Cappuccino 7 3.0
4 Espresso 3 2.5
5 Latte 2 3.5
6 Cappuccino 6 3.0
;
run;

data coffe_cost;
    input coffe_type $ amount cost;
    datalines;
Espresso 1 1.0
Latte 1 1.5
Cappuccino 1 2.0
;
run;


%let parameter = 10;

%macro apply_change_value;

	/*This part creates a parameter to use in our SQL code.*/


	* Step 2: Let's stress the values;



	/*Another way to create a parameter is shown in below.*/

	data _null_;
	    set parameter_table;
	    call symputx('parameter',change_value,"g");
	run;


	/*Then we can easily change our datasets with the parameter that we assigned.*/  

	PROC SQL;

	create table costs_of_orders as
	select order.*, cost.*, (order.usage_amount/cost.amount)*order.price as cost_of_order
	from coffee_order order
	left join coffe_cost cost on order.coffe_type=cost.coffe_type;

	QUIT; 
	
	
	
	

%mend apply_change_value;

/*Because we wrote a macro thus we have to call it to use it.*/

%apply_change_value;





