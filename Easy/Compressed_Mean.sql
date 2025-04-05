select
round(sum(item_count*order_occurrences)::DECIMAL/sum(order_occurrences),1) as mean
from items_per_order;