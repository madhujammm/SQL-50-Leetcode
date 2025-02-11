select 
    round(100.0*count(distinct case when order_date = customer_pref_delivery_date then customer_id else null end)/count(distinct customer_id),2) as immediate_percentage
from (
    select 
        customer_id,
        order_date,
        dense_rank() over (partition by customer_id order by order_date asc) as ranks,
        customer_pref_delivery_date
    from 
        Delivery
) a
where 
    ranks = 1
