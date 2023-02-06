view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: sold {
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
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, products.id, products.item_name, order_items.count]
  }

  measure: total_cost {
    type: sum
    sql: ${TABLE}.cost ;;
  }

  measure: cost_by_100_liquid {
    type: number
    sql: ${TABLE}.cost ;;
    html: {{ rendered_value | times: 100 | round: 2 | append: "%"}} ;;
  }

  measure: cost_by_100_format {
    type: number
    sql: ${TABLE}.cost ;;
    value_format: "0.00"
    html: {{ rendered_value | append: "%" }} ;;
  }

  # measure: test_using_a_measure {
  #   type: number
  #   sql: ${inventory_items.total_cost} / ${order_items.count};;
  # }

  # measure: avg_test {
  #   type: average
  #   sql: ${cost} ;;
  #   filters: {
  #     field: order_items.order_id
  #     value:"100"
  #   }
  # }
}
