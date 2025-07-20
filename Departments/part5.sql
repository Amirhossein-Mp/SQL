create materialized view mv_top_customers as (select customer_id,sum(sales.sales) as total_purchases ,rank() over (ORDER BY count(*) DESC )
as rank from sales group by customer_id)
select * from mv_top_customers limit 3