%dw 2.0
output application/json
---
payload groupBy $.order_id mapObject {
    orderId: $$,
    source: $[0].source,
    customer: $[0].customer_name,
    items: $ map {
        productId: ($.item_id splitBy "|")[1] default $.item_id,
        name: $.product_name,
        price: $.price,
        quantity: $.quantity
    } filter $.productId != null,
    totalAmount: $[0].total_amount,
    orderDate: $[0].order_date as DateTime
}