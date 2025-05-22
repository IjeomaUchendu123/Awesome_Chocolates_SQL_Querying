----- 1.) Shipment information with names and categories of products

select s.SaleDate, pr.Product, pr.Category, pr.PID, s.PID, s.Amount
from sales s
JOIN products pr on pr.PID = s.PID;

----- 2.) Shipments with sales person name and team
  
  select s.SaleDate, p.salesperson, s.SPID, p.Team, p.location
  from sales s
  JOIN people p on s.SPID = p.SPID;
  
----- 3.) Bar Shipments alone
select s.SaleDate, s.PID, s. Amount, pr.Product, pr.PID, pr.Category
from sales s
JOIN products pr ON s.PID = pr.PID
WHERE pr.category = "Bars";

----- 4.) Salesperson Barr Shipments alone

select s.SaleDate, s. Amount, p.Salesperson, p.Team
from sales s
JOIN people p ON s.SPID = p.SPID
WHERE p.Salesperson = "Barr Faughny";


----- 5.) SHIPMENT INFORMATION FOR ALL OUR PRODUCTS

Select s.SaleDate, pr.product, pr.PID, s.PID, s.Amount
FROM products pr 
LEFT JOIN sales s on s.PID = pr.PID;

----- 6.) Did we ship all the products on first of Feb, 2022 ?

with febProds as (
                   select pr.Product, s.Amount, s.SaleDate 
				FROM products pr 
				LEFT JOIN sales s on s.PID = pr.PID and s.SaleDate = '2022-2-1')

select product, sum(amount) as 'Sales', 
	CASE 
        WHEN sum(amount) > 0 THEN 
        'shipped'
    else 'Not_shipped'
end as Sales_Status
from febProds
group by product;


----- 7.) Bar Barr shipments, grouped by month

select date_format(s.SaleDate, '%M %Y') as "Month", sum(s.Amount) "Sales", sum(s.Boxes) "Boxes", p.Salesperson
FROM sales s
JOIN products pr on pr.PID = s.PID
JOIN people p on p.SPID = s.SPID
WHERE p.Salesperson = "Barr Faughny" and pr.Category = "Bars"
group by date_format(s.SaleDate, '%M %Y');

----- 8.) Gunar Cockshoot Shipments alone with JOIN clause

select s.SaleDate, s. Amount, p.Salesperson, p.Team
from sales s
JOIN people p ON s.SPID = p.SPID
and p.Salesperson = "Gunar Cockshoot";

----- 9.) ANTI -JOINS - Which products haven't been sold at all

Select s.SaleDate, pr.product, pr.PID, s.PID, s.Amount
FROM products pr 
LEFT JOIN sales s on s.PID = pr.PID
WHERE s.PID is null;

----- 10.) Dennison Crosswaite Bar Shipments

select s.SaleDate, s.Amount, p.SalesPerson, p.Team, pr.Category, pr.Product, pr.Category
from sales s
JOIN people p on p.SPID = s.SPID
JOIN products pr on pr.PID = s.PID
and p.Salesperson = "Dennison Crosswaite" and pr.Category = "Bars"
order by s.Amount desc;

Select * from people;