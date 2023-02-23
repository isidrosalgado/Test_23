view: order {

# The original dimension group
  dimension_group: created {
    hidden: yes
    type: time
    timeframes: [date,week,month]
    sql: ${TABLE}.created_at ;;
  }
# The customized timeframes, organized in the Explore field picker under the group label Created
  dimension: date_formatted {
    group_label: "Created" label: "Date"
    sql: ${created_date} ;;
    html: {{ rendered_value | date: "%b %d, %y" }};;
  }

  dimension: month_formatted {
    group_label: "Created" label: "Month"
    sql: ${created_date} ;;
    html: {{ rendered_value | date: "%B %Y" }};;
  }

  dimension: week_formatted {
    group_label: "Created" label: "Week"
    sql: ${created_date} ;;
    html: {{ rendered_value | date: "Week %U (%b %d)" }};;
  }
}
