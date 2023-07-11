view: sql_runner_query {
  derived_table: {
    sql: SELECT
          event.category AS event_category,
              (DATE(event.CREATED_AT )) AS event_created_date,
              (CASE WHEN event.is_admin THEN 'Yes' ELSE 'No' END) AS event_is_admin,
              (CASE WHEN event.is_looker_employee THEN 'Yes' ELSE 'No' END) AS event_is_looker_employee,
          event.name AS event_name,
          COUNT(*) AS event_count
      FROM event
      WHERE (event.category) = 'settings'
      GROUP BY
          1,
          2,
          3,
          4,
          5
      ORDER BY
          2 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_category {
    type: string
    sql: ${TABLE}.event_category ;;
  }

  dimension: event_created_date {
    type: date
    datatype: date
    sql: ${TABLE}.event_created_date ;;
  }

  dimension: event_is_admin {
    type: string
    sql: ${TABLE}.event_is_admin ;;
  }

  dimension: event_is_looker_employee {
    type: string
    sql: ${TABLE}.event_is_looker_employee ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: event_count {
    type: number
    sql: ${TABLE}.event_count ;;
  }

  set: detail {
    fields: [
      event_category,
      event_created_date,
      event_is_admin,
      event_is_looker_employee,
      event_name,
      event_count
    ]
  }
}
