view: dt_orders_suggestions {
  derived_table: {
    sql: SELECT
          users.city  AS `users.city`,
          users.country  AS `users.country`,
          users.state    AS `users.state`,
          orders.id  AS `orders.id`,
          orders.status  AS `orders.status`,
          orders.user_id  AS `orders.user_id`
      FROM demo_db.orders  AS orders
      LEFT JOIN demo_db.users  AS users ON orders.user_id = users.id
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6
      ORDER BY
          users.city
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_city {
    type: string
    sql: ${TABLE}.`users.city` ;;
  }

  dimension: users_country {
    type: string
    sql: ${TABLE}.`users.country` ;;
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}.`users.state` ;;
  }

  dimension: orders_id {
    type: number
    sql: ${TABLE}.`orders.id` ;;
  }

  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  dimension: orders_user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.`orders.user_id` ;;
  }

  set: detail {
    fields: [
      users_city,
      users_country,
      users_state,
      orders_id,
      orders_status,
      orders_user_id
    ]
  }
}
