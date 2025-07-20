select c.customer_id, c.customer_name,
COALESCE(bc.category, 'This custumer has no order!') as category,
COALESCE(bc.total_quantity, 0) as purchase_count
from customers c
left join lateral (
    select s.category, sum(s.quantity) as total_quantity
    	from sales s
    	where s.customer_id = c.customer_id
    	group by s.category
    	order by total_quantity desc limit 1
) as bc on true
order by c.customer_id;