view: test_j {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  filter: f_filter {
    type: date
    sql:
    CASE
    WHEN  {% date_start f_filter%}  is not null AND {% date_end f_filter%} is not null
    THEN (${TABLE}.returned_at >= {% date_start f_filter%} AND ${TABLE}.returned_at < {% date_end f_filter%})
    ELSE (${TABLE}.returned_at >= {% date_start f_filter%} OR ${TABLE}.returned_at < {% date_end f_filter%})
    END;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: total_sale_price {
    type: sum
    sql: ${TABLE}.sale_price  ;;
    value_format:  "$0.00"
  }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }

  measure:sumMoney  {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd

  }
}
