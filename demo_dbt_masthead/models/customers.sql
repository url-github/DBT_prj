with customers as (
    select * from dbt_dataset.mh_customers_raw
),

orders as (
    select * from {{ ref('stg_orders') }}
),

customer_orders as (
    select
        customer_id,
        min(ordered_at) as first_order_date,
        max(ordered_at) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(subtotal) as spends_total,
        sum(tax_paid) as taxes_total
    from orders
    group by 1
),

final as (
    select
        customers.string_field_0 as customer_id,
        customers.string_field_1 as full_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        customer_orders.spends_total,
        customer_orders.taxes_total
    from customers
    left join customer_orders on customers.string_field_0 = customer_orders.customer_id
)

select * from final
