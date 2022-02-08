run tblsOMS first in mysql shell or workbench

then run seederOMS

db structure

```
countries (id, name)

states (id countr_id name)

postal_codes (id, country_id, state_id, name)

customers (id, f name, l name, phone, email, add1, add2,country_id,state_id,city_id, post_id )

orders (id, order_name, customer_id, product_id)

categories (id, category_name)

products (id, product_name)
```