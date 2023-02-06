view: dt_orders_order_items {
  derived_table: {
    explore_source: order_items_test {
      column: orders_id { field: orders.id }
      column: is_max_close_date { field: orders.is_max_close_date }
      column: status { field: orders.status }
      column: user_id { field: orders.user_id }
      column: order_items_id { field: order_items.id }
      column: inventory_item_id { field: order_items.inventory_item_id }
      column: order_id { field: order_items.order_id }
      column: sale_price { field: order_items.sale_price }
      column: returned_date { field: order_items.returned_date }
      column: returned_month { field: order_items.returned_month }
      column: returned_quarter { field: order_items.returned_quarter }
      column: returned_time { field: order_items.returned_time }
      column: returned_week { field: order_items.returned_week }
      column: returned_year { field: order_items.returned_year }
      column: max_create_date { field: orders.max_create_date }
      column: created_date { field: orders.created_date }
      column: created_month { field: orders.created_month }
      column: created_quarter { field: orders.created_quarter }
      column: created_time { field: orders.created_time }
      column: created_week { field: orders.created_week }
      column: created_year { field: orders.created_year }
    }
  }
  dimension: orders_id {
    primary_key: yes
    description: ""
    type: number
  }
  dimension: is_max_close_date {
    label: "Orders Is Max Close Date (Yes / No)"
    description: ""
    type: yesno
  }
  dimension: status {
    description: ""
  }
  dimension: user_id {
    description: ""
    type: number
  }
  dimension: order_items_id {
    description: ""
    type: number
  }
  dimension: inventory_item_id {
    description: ""
    type: number
  }
  dimension: order_id {
    description: ""
    type: number
  }
  dimension: sale_price {
    description: ""
    type: number
  }
  dimension: returned_date {
    description: ""
    type: date
  }
  dimension: returned_month {
    description: ""
    type: date_month
  }
  dimension: returned_quarter {
    description: ""
    type: date_quarter
  }
  dimension: returned_time {
    description: ""
    type: date_time
  }
  dimension: returned_week {
    description: ""
    type: date_week
  }
  dimension: returned_year {
    description: ""
    type: date_year
  }
  dimension: max_create_date {
    description: ""
  }
  dimension: created_date {
    description: ""
    type: date
  }
  dimension: created_month {
    description: ""
    type: date_month
  }
  dimension: created_quarter {
    description: ""
    type: date_quarter
  }
  dimension: created_time {
    description: ""
    type: date_time
  }
  dimension: created_week {
    description: ""
    type: date_week
  }
  dimension: created_year {
    description: ""
    type: date_year
  }
}
