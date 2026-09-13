
-- I used this date as a current date that is 2018-10-17 because this data is belong to 2018 and if i'll use today's date
-- in 2026 then there will be huge recency 

select max(order_purchase_timestamp)
from orders;

-- Recency measure

select c.customer_unique_id,
max(order_purchase_timestamp) as Last_order_date,
-- current date - last order date
(select max(order_purchase_timestamp) from orders) - (max(order_purchase_timestamp)) as Recency 
from orders o
join customers c
on o.customer_id=c.customer_id
group by c.customer_unique_id
order by recency asc;


-- Frequency measure

select c.customer_unique_id,
-- here i use distinct to get required count of order_id because in data customer use different
-- payment method for one order 
count(o.order_id) as frequency
from orders o
join customers c
on o.customer_id=c.customer_id
group by c.customer_unique_id
order by frequency desc;


-- Monetary 

select c.customer_unique_id,
sum(p.payment_value) as Payment
from order_payments p
join orders o
on p.order_id=o.order_id
join customers c
on c.customer_id=o.customer_id
group by c.customer_unique_id
order by Payment desc;


-- Combining RFM

-- here i use cte because i need the max value of last order purchase but order payment table
-- has multiple payment method for single order and it gives multiple values for one row

with max_date as(
select max(order_purchase_timestamp) as latest_date from orders  
)
select c.customer_unique_id,
(select latest_date from max_date) - max(o.order_purchase_timestamp) as recency,
count(distinct o.order_id) as frequency,
sum(p.payment_value) as Monetary
from order_payments p
join orders o
on p.order_id=o.order_id
join customers c
on o.customer_id=c.customer_id
group by c.customer_unique_id
order by Monetary desc;


--using  quintile and case statement for ranking for RFM

with max_date as(
select max(order_purchase_timestamp) as latest_date from orders  
),
rfm as(
select c.customer_unique_id,
((select latest_date from max_date) - max(o.order_purchase_timestamp)) as recency,
count(distinct o.order_id) as frequency,
sum(p.payment_value) as Monetary
from order_payments p
join orders o
on p.order_id=o.order_id
join customers c
on o.customer_id=c.customer_id
group by c.customer_unique_id
),
ranking as(
select customer_unique_id,
recency,
frequency,
monetary,
ntile(5) over(order by recency desc) as r_ranking,
case
when frequency =1 then 1
when frequency =2 then 2
when frequency =3 then 3
when frequency between 4 and 5 then 4
else 5
end as f_ranking,
ntile(5) over(order by monetary asc) as m_ranking
from rfm)
select *
from ranking
;


-- to investigate the zero value


with max_date as(
select max(order_purchase_timestamp) as latest_date from orders  
),
rfm as(
select c.customer_unique_id,
((select latest_date from max_date) - max(o.order_purchase_timestamp)) as recency,
count(distinct o.order_id) as frequency,
sum(p.payment_value) as Monetary
from order_payments p
join orders o
on p.order_id=o.order_id
join customers c
on o.customer_id=c.customer_id
group by c.customer_unique_id
),
ranking as(
select customer_unique_id,
recency,
frequency,
monetary,
ntile(5) over(order by recency desc) as r_ranking,
case
when frequency =1 then 1
when frequency =2 then 2
when frequency =3 then 3
when frequency between 4 and 5 then 4
else 5
end as f_ranking,
ntile(5) over(order by monetary asc) as m_ranking
from rfm
order by monetary desc)
SELECT
    monetary,
    COUNT(*) AS customers
FROM ranking
WHERE monetary = 0
GROUP BY monetary;


select o.order_status ,p.payment_value,p.payment_type
from orders o
join order_payments p
on o.order_id=p.order_id
where p.payment_value=0 
and payment_type ='not_defined'
;

-- to concate the scoring to see the real counting

with max_date as(
select max(order_purchase_timestamp) as latest_date from orders  
),
rfm as(
select c.customer_unique_id,
((select latest_date from max_date) - max(o.order_purchase_timestamp)) as recency,
count(distinct o.order_id) as frequency,
sum(p.payment_value) as Monetary
from order_payments p
join orders o
on p.order_id=o.order_id
join customers c
on o.customer_id=c.customer_id
group by c.customer_unique_id
),
ranking as(
select customer_unique_id,
recency,
frequency,
monetary,
ntile(5) over(order by recency desc) as r_ranking,
case
when frequency =1 then 1
when frequency =2 then 2
when frequency =3 then 3
when frequency between 4 and 5 then 4
else 5
end as f_ranking,
ntile(5) over(order by monetary asc) as m_ranking
from rfm)
select concat(r_ranking,f_ranking,m_ranking) as Numbering, count(*) as Counting
from ranking
group by Numbering
order by numbering desc
;


-- for segmentation i'll use these seperately for ease


with max_date as(
select max(order_purchase_timestamp) as latest_date from orders  
),
rfm as(
select c.customer_unique_id,
((select latest_date from max_date) - max(o.order_purchase_timestamp)) as recency,
count(distinct o.order_id) as frequency,
sum(p.payment_value) as Monetary
from order_payments p
join orders o
on p.order_id=o.order_id
join customers c
on o.customer_id=c.customer_id
group by c.customer_unique_id
),
ranking as(
select customer_unique_id,
recency,
frequency,
monetary,
ntile(5) over(order by recency desc) as r_ranking,
case
when frequency =1 then 1
when frequency =2 then 2
when frequency =3 then 3
when frequency between 4 and 5 then 4
else 5
end as f_ranking,
ntile(5) over(order by monetary asc) as m_ranking
from rfm),
Segmentation as (
select *,
case 
 when r_ranking in (4,5) and f_ranking in (4,5) and m_ranking in (4,5) then 'Champions'
 when r_ranking in (4,5) and f_ranking in (4,5) and m_ranking in (1,2,3) then 'Potential loyalists'
 when r_ranking in (3,4,5) and f_ranking in (3,4,5) then 'Loyal customers'
 when r_ranking in (4,5) and f_ranking in (2) then 'Growing Spenders'
 when r_ranking in (4,5) and f_ranking in (1) then 'New Signups'
 when r_ranking in (3) and f_ranking in (2) then 'Occasional Buyers'
 when r_ranking in (3) and f_ranking in (1) then 'Casual Buyers'
 when r_ranking in (1,2) and f_ranking in (3,4,5) then 'At risk loyals'
 when r_ranking in (1,2) and f_ranking in (2) then 'Fading customers'
 when r_ranking in (1,2) and f_ranking in (1) then 'Churned'
else 'Unclassified'
end as Segments
 from ranking)
select segments, count(*) as total_count
from segmentation
group by segments
order by total_count desc
;

-- Repeating customers

select count(*) as repeat_customer 
from (
select c.customer_unique_id, count(o.order_id) as repeat_orders
from orders o
join customers c
on o.customer_id=c.customer_id
group by c.customer_unique_id
having count(o.order_id) > 1
) 
 ;

 -- Repeat customer by segments
 
 select s.segments, count(*) as repeat_customer 
from (
select c.customer_unique_id, count(o.order_id) as repeat_orders
from orders o
join customers c
on o.customer_id=c.customer_id
group by c.customer_unique_id
having count(o.order_id) > 1
) r
join customer_segments s
on r.customer_unique_id=s.customer_unique_id
group by s.segments
 ;

 -- Creating table for segments

create table customer_segments as
with max_date as(
select max(order_purchase_timestamp) as latest_date from orders  
),
rfm as(
select c.customer_unique_id,
((select latest_date from max_date) - max(o.order_purchase_timestamp)) as recency,
count(distinct o.order_id) as frequency,
sum(p.payment_value) as Monetary
from order_payments p
join orders o
on p.order_id=o.order_id
join customers c
on o.customer_id=c.customer_id
group by c.customer_unique_id
),
ranking as(
select customer_unique_id,
recency,
frequency,
monetary,
ntile(5) over(order by recency desc) as r_ranking,
case
when frequency =1 then 1
when frequency =2 then 2
when frequency =3 then 3
when frequency between 4 and 5 then 4
else 5
end as f_ranking,
ntile(5) over(order by monetary asc) as m_ranking
from rfm),
Segmentation as (
select *,
case 
 when r_ranking in (4,5) and f_ranking in (4,5) and m_ranking in (4,5) then 'Champions'
 when r_ranking in (4,5) and f_ranking in (4,5) and m_ranking in (1,2,3) then 'Potential loyalists'
 when r_ranking in (3,4,5) and f_ranking in (3,4,5) then 'Loyal customers'
 when r_ranking in (4,5) and f_ranking in (2) then 'Growing Spenders'
 when r_ranking in (4,5) and f_ranking in (1) then 'New Signups'
 when r_ranking in (3) and f_ranking in (2) then 'Occasional Buyers'
 when r_ranking in (3) and f_ranking in (1) then 'Casual Buyers'
 when r_ranking in (1,2) and f_ranking in (3,4,5) then 'At risk loyals'
 when r_ranking in (1,2) and f_ranking in (2) then 'Fading customers'
 when r_ranking in (1,2) and f_ranking in (1) then 'Churned'
else 'Unclassified'
end as Segments
 from ranking)
select segments, customer_unique_id
from segmentation
;

-- segment wise payment

select cs.segments, sum(p.payment_value)
from orders o
join order_payments p
on o.order_id=p.order_id
join customers c
on o.customer_id=c.customer_id
join customer_segments cs
on c.customer_unique_id=cs.customer_unique_id
group by cs.segments
;


-- Churned customer by month


select date_trunc('month',last_purchase_date) as churn_month ,
count(*) as Total_count
from (
select s.customer_unique_id,max(o.order_purchase_timestamp) as last_purchase_date
from customer_segments s
join customers c
on s.customer_unique_id=c.customer_unique_id
join orders o
on c.customer_id=o.customer_id
where s.segments='Churned'
group by s.customer_unique_id
) as customer_last_order
group by date_trunc('month',last_purchase_date)
order by date_trunc('month',last_purchase_date) 
;





