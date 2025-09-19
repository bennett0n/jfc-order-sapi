%dw 2.0
output application/java

var orderId = p('sql.query.orders.dynamic-where.orderId')
var source = p('sql.query.orders.dynamic-where.source')
---
orderId
++ (if(vars.queryParam.source != null) source else ' ' )