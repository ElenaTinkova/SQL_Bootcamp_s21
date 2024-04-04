--  create a Database View v_price_with_discount that returns
--  a person's orders with person names, pizza names,
--  real price and calculated column discount_price
--  (with applied 10% discount and satisfies formula price - price*0.1).
--  sort by person name and pizza name and make a round for discount_price column to integer type.

CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, round(price - price*0.1) AS discount_price
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN person ON person_order.person_id = person.id
ORDER BY name, pizza_name;