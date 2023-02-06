view: subscriptions_daily_capture_testing {

  derived_table: {

    indexes: ["customer_id"]
    increment_key: "processing_date"
    increment_offset: 0
    sql_trigger_value: SELECT DATE(CURRENT_TIMESTAMP);;
    distribution_style: all
    explore_source: subscriptions_summary {
      column: customer_id {}
      column: processing_date {}
      column: ARR {}
    }

  }
# Define your dimensions and measures here, like this:
  dimension: customer_id {
    description: "Unique ID for each customer"
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: processing_date {
    type: string
    sql: ${TABLE}.processing_date ;;
  }

  dimension: ARR {
    description: "Annual recurring revenue"
    type: number
    sql: ${TABLE}.ARR ;;
  }
}
