view: dt_orders {

  derived_table: {
#<<<<<<< HEAD
  sql: SELECT id,created,max_create_date
      from orders as A
      ;;
}

dimension: id {
  primary_key: yes
  type: number
  sql: ${TABLE}.id ;;
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

dimension: max_create_date {
  type: string
  sql: ${TABLE}.max_create_date;;
}

}
