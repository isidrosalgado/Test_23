view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]




#testsssssssssssssssssssssconcat


  dimension: week_test {
    sql: WEEK(${TABLE}.created_at);;
   group_label: "Date Date"
  group_item_label: "Week Test"
  }
  dimension: day_test {
    hidden: yes
    sql: DAY(${TABLE}.created_at);;
    group_label: "Date Date"
    group_item_label: "Week Test"
  }

 dimension_group: date {
   type: time
  timeframes: [
   raw,
      date,
     week,
    month,
    month_name,
    quarter,
    year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at ;;
}


  dimension: test {
  type: string
  sql: CONCAT(CAST(${date_month_name} AS CHAR(3)), ' ', CAST(YEAR(${TABLE}.created_at) AS CHAR)) ;;
}


 # dimension: test {
  #  type: string
   # sql: CONCAT(CAST(${date_month_name} AS CHAR),' || Wk- ', CAST(ROUND((CONVERT(DAY(${TABLE}.created_at),DECIMAL)+6)/7) AS CHAR)) ;;
  #}

#testssssssssssssssssAlankritaconcat

#testssssssssssssssssAkhmerovliquid

  dimension: prior_month_label {
    label: "Prior Month"
    type: string
    sql: {% assign yr = 'now' | date: '%Y' %}
    {% assign month = 'now' | date: '%m' %}
    {% assign prior_month = month | minus: 1 %}
    {% assign prior_date = yr | append: '-' | append: prior_month | append: '-01' %}
    "{{ prior_date | date: '%b' }} {{ yr }}";;
  }

  dimension: prior_month {
    type: string
    sql: {% assign prior_month = date_month | date: '%m' | minus: 1 %}
       {% assign prior_year = date_month | date: '%Y' %}
       {% if prior_month == 0 %}
         {% assign prior_month = 12 %}
         {% assign prior_year = prior_year | minus: 1 %}
       {% endif %}
       {% assign prior_date = prior_year | append: '-' | append: prior_month | append: '-01' %}
       "{{ prior_date | date: '%b %Y' }}";;
  }

#testssssssssssssssssAkhmerovliquid
  dimension: month {
    type: string
    sql: ${TABLE}.[Date] ;;

    value_format: "MMM"

  }
#testsssssssssssssssssssZianWang
dimension: time_stamp{
  sql:  ${TABLE}.created_at ;;

}

dimension: test_date {
  sql: ${TABLE}.created_at ;;
  html: {{rendered_value |date:"%s"}};;

}
#testsssssssssssssssssssZianWang

#---------------------------concatenaciones-----------------------
  #dimension: week_test {
   # sql: WEEK(${TABLE}.date);;
   # group_label: "Date Date"
    #group_item_label: "Week Test"
  #}
  #dimension: day_test {
  #  hidden: yes
   # sql: DAY(${TABLE}.date);;
  #  group_label: "Date Date"
   # group_item_label: "Week Test"
  #}

  #dimension: month_name_test {
  #  hidden: yes
  #  sql: MONTHNAME(${TABLE}.date);;
  #  group_label: "Date Date"
   # group_item_label: "Month Name Test"
  #}


  #dimension: week_string {
   # type: string
    #sql: CONCAT(CAST(${week_test} AS CHAR),' || Wk- ', CAST(ROUND((CONVERT(${day_test},DECIMAL)+6)/7) AS CHAR)) ;;
    #group_label: "Date Date"
  #}

  #dimension: month_string {
   # type: string
    #sql: CONCAT(CAST(${month_name_test} AS CHAR),' || Wk- ', CAST(ROUND((CONVERT(${day_test},DECIMAL)+6)/7) AS CHAR)) ;;
    #group_label: "Date Date"
  #}

#---------------------------concatenaciones-----------------------



  parameter: date_start {
    type: date
    description: "Use this field to select a date to filter results by."
  }

  parameter: date_end {
    type: date
    description: "Use this field to select a date to filter results by."
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  ##Test----
  dimension_group: orders{
    type: time
    timeframes: [
      raw,
      date,
      hour,
      minute,
      second
    ]
    sql: ${TABLE}.created_at ;;
  }
  #test

  dimension: max_create_date {
    type: string
    sql: (SELECT MAX(created_at) FROM  demo_db.orders) ;;
  }




  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  #test_yes_no.............................

  dimension: status_yes_no {
    label: "yes no"
    type: yesno
    sql:${TABLE}.status IN ('pending', 'complete') ;;
  }

  measure: count_yes_no {
    type: sum_distinct
   sql: ${status_yes_no};;
   value_format: "$#.00;($#.00)"

  }

  measure:count_yes_no_percent {
    type: percent_of_total
    sql: ${status_yes_no};;
    value_format: "0.000"
  }

   #test_yes_no.............................

  measure: count {
    type: count
    html: {{ rendered_value }} | {{Orders_sum._rendered_value }} of total  ;;
    #drill_fields: [orders*]
  }



  measure: Orders_sum {
    type: sum
    sql: ${user_id} ;;
  }



  measure: stat_drill {
    type: string
    sql: ${TABLE}.status ;;
    html:  <p style = "color:red" >{{linked_value}} </p> ;;
    link: {
      label: "Count per Year and Status"
      url: "{{ link }}&fields=orders.drill_set_combo_1*"
    }
    link: {
      label: "Count User id per Status"
      url: "{{ link }}&fields=view_name.drill_set_combo_2*"
    }
  }

  set: drill_set_combo_1 {
    fields: [orders.count,orders.created_year]
  }

  set: drill_set_combo_2 {
    fields: [orders.count,orders.user_id]
  }

  ############

  measure: Last_Create_Date {
    type: date
    #sql: MAX(${TABLE}.created_at) ;;
    sql: MAX(${TABLE}.created_at);;
    convert_tz: no
  }

  ##-----------------------------------------
  filter: day {
    type: date
  }

##Ticket 529170 bug: 244354400
  dimension: start_date {
    hidden: yes
    type: date
    sql: {% date_start day %} ;;
  }

  dimension: end_date {
    type: date
    sql: {% date_end day %} ;;
  }

##---------------------------------------
  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      ten_million_orders.count
    ]
  }



  dimension: new_dimension{
    type: string
    sql: (select * from  [SCHEMA].NOT_NULL_GA_SESSION_CDS_SURROGATE_KEY);;

  }

  dimension: id_null {
    type: number
    sql:
      CASE
        WHEN ${TABLE}.id IS NULL THEN 100000000
        ELSE ${TABLE}.id
      END
    ;;
  }

  measure: count_of_cancellations {
    type: number
    sql:COUNT(distinct ${id}) ;;
    drill_fields: [id,user_id,status]
    #sql_distinct_key: ${user_id} ;;
  }
  #bug testing
  measure: negative_count {
    type: number
    sql: ${count_of_cancellations}*-1 ;;
  }

  measure: negative_1 {
    type: number
    sql: ${count_of_cancellations}*-1+1;;
  }

  measure: test_cunt {
    type: count_distinct
    sql: ${id} ;;
  }

  measure: test_avg {
    type: number
    sql: 1.0 * ${test_cunt}/${Orders_sum};;
  }

  filter: date_filter {
    type: date
  }




}
