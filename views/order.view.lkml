view: order {


    dimension_group: service_datetime {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        month_name,
        week_of_year,
        quarter,
        year
      ]
      datatype: timestamp
      sql: CAST(${TABLE}."order_datetime" AS TIMESTAMP_NTZ) ;;
    }
    dimension: week_of_month {
      type: string
      sql: CONCAT(
              CAST(${service_datetime_month_name} AS VARCHAR),
              ' || ',
              'Wk-',
              CAST(Round((day(${TABLE}."order_datetime")+6)/7,0) AS VARCHAR)
            ) ;;
    }

































  # # You can specify the table name if it's different from the view name:
  sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
   dimension: user_id {
     description: "Unique ID for each user that has ordered"
     type: number
     sql: ${TABLE}.user_id ;;
   }

   dimension: lifetime_orders {
     description: "The total number of orders for each user"
     type: number
     sql: ${TABLE}.lifetime_orders ;;
   }

   dimension_group: most_recent_purchase {
     description: "The date when each user last ordered"
     type: time
     timeframes: [date, week, month, year]
     sql: ${TABLE}.most_recent_purchase_at ;;
   }

   measure: total_lifetime_orders {
     description: "Use this for counting lifetime orders across many users"
     type: sum
     sql: ${lifetime_orders} ;;
   }
}

# view: order {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
