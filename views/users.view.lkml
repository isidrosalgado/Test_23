view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: ejemplo_date_format {
    sql: '2022-01-01 14:39' ;;
    html: {{rendered_value | date: "%b %d, %Y"}} ;;
  }


  dimension: audit_formatted {
    group_label: "DATE_MODIFIED"
    label: "DATE_MODIFIED"
    sql: ${TABLE}.created_at ;;
    #html: {{ rendered_value | date: current_user.date_format._value }};;
    value_format: "dd mmm yyyy"
  }



  measure: count_test {
    type: count_distinct
    sql: ${gender} ;;
    filters: [gender: "f"]
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: gender_1 {
    type: yesno
    sql: 1 ;;
    drill_fields: [detail*,email,age]
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }



  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql:
    case
        when ${TABLE}.state = 'Alabama' then 'Alabama 2'
    else
        ${TABLE}.state
    end
     ;;
    html:

    {% if state._value == "Alabama 2" %}

          <b>{{rendered_value}}<b>

      {% elsif state._value == "Alaska" %}

      <b>{{rendered_value}}<b>

      {% elsif state._value == "Idaho" %}

      <b>{{rendered_value}}<b>

      {% elsif state._value == "Operating Expenses" %}

      <b>{{rendered_value}}<b>

      {% elsif state._value == "Adjusted EBITDA" %}

      <b>{{rendered_value}}<b>

      {% elsif state._value == "Y/Y Revenue Growth" %}

      <i><font color="grey">{{rendered_value}}</font></i>

      {% elsif state._value == 'Gross Margin %' %}

      <i><font color="grey">{{rendered_value}}</font></i>

      {% elsif state._value == 'Contribution Margin %' %}

      <i><font color="grey">{{rendered_value}}</font></i>

      {% elsif state._value == 'Adjusted EBITDA Margin %' %}

      <i><font color="grey">{{rendered_value}}</font></i>



      {% else %}

      <i><font color="red">{{rendered_value}}</font></i>

      {% endif %} ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*,email,age]
  }


  dimension: test_city {
    type: string
    sql: ${TABLE}.city ;;
    suggest_explore: users_test
    suggest_dimension: dt_suggestions.users_state
  }

  dimension: date_formatted_1 {
    sql: ${created_date} ;;
    html: {{ rendered_value | date: "%A, %B %e, %Y" }} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      saralooker.count,
      sindhu.count,
      user_data.count
    ]
  }

#<<<<<<< HEAD
  measure: avg_age {
    type: average
    sql: ${age} ;;
    drill_fields: [detail*]
#=======
  }
  set: test {
    fields: [
      sindhu.count,
      user_data.count
    ]
#>>>>>>> branch 'master' of git@github.com:hijuancarlos/gcpm2210_thelook-.git
  }

  filter: two_states {
    type: string
    sql: ${TABLE}.state != "New York"  ;;
  }

  dimension: test_state {
    type: string
    sql: ${TABLE}.state;;
  }

  dimension_group: usage {
    type: time
    datatype: date
    timeframes: [date, week, month, quarter]
    sql: date_format(${TABLE}.created_at,'%Y-%m-%d');;
  }

  dimension: date_formatted {
    type: string
    sql: ${usage_date} ;;
    html: {{ rendered_value | date: "%m/%d/%Y" }} ;;
  }

  dimension: date_formatted_2 {
    type: string
    sql: date_format((${TABLE}.created_at),'%Y%m%d');;

  }

  dimension: date_formatted_3 {
    type: string
    sql: date_format((${TABLE}.created_at),' %b %d, %Y');;

  }


  dimension: max_date_1 {
    type: string
    sql: date_format((SELECT max(${TABLE}.created_at) FROM users),'%Y%m%d');;
  }

  measure: max_date {
    type: string
    sql: date_format(max(${TABLE}.created_at),'%Y%m%d');;
  }
  measure: min_date {
    type: string
    sql: date_format(min(${TABLE}.created_at),'%Y%m%d');;
  }

  measure: max_date_number {
    type: number
    sql: date_format(max(${TABLE}.created_at),'%Y%m%d');;
  }
  measure: min_date_number {
    type: number
    sql: date_format(min(${TABLE}.created_at),'%Y%m%d');;
  }
  dimension: date_formatted_number {
    type: number
    sql: date_format((${TABLE}.created_at),'%Y%m%d');;
  }

  dimension: max_date_ {
    type: date
    sql: (SELECT max(${TABLE}.created_at) FROM users)  ;;
  }

  measure: avg_age_1 {
    type: average
    sql: ${age} ;;
    drill_fields: [detail*]
  }



  measure: metric_value {
    type: average
    label: "Actuals"
    sql: ${TABLE}.age;;
    html:

      {% if state._value == "Alabama 2" %}

            <b>{{rendered_value}}<b>

      {% elsif state._value == "Alaska" %}

      <b>{{rendered_value}}<b>

      {% elsif state._value == "Idaho" %}

      <b>{{rendered_value}}<b>

      {% elsif state._value == "Operating Expenses" %}

      <b>{{rendered_value}}<b>

      {% elsif state._value == "Adjusted EBITDA" %}

      <b>{{rendered_value}}<b>

      {% elsif state._value == "Y/Y Revenue Growth" %}

      <i><font color="grey">{{rendered_value}}</font></i>

      {% elsif state._value == 'Gross Margin %' %}

      <i><font color="grey">{{rendered_value}}</font></i>

      {% elsif state._value == 'Contribution Margin %' %}

      <i><font color="grey">{{rendered_value}}</font></i>

      {% elsif state._value == 'Adjusted EBITDA Margin %' %}

      <i><font color="grey">{{rendered_value}}</font></i>



      {% else %}

      <i><font color="grey">{{rendered_value}}</font></i>

      {% endif %} ;;
  }
#REPRO Ticket 512603
  measure: answer_details_decode{
    type: string
    sql: "Answer Details Decode URL" ;;
    link:{
      label: "View details by Question DECODE URL"
      #url: "{{ responses_by_answer._link }}&pivots=products.department&sorts=products.total_retail_price+desc+0,products.department&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22d754397b-2c05-4470-bbbb-05eb4c2b15cd%22%2C%22palette_id%22%3A%22b0768e0d-03b8-4c12-9e30-9ada6affc357%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22users.gender%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22products.department%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&limit=10&column_limit=10"
      # DECODE url: "{% assign vis_config = '{\"x_axis_gridlines\":false,\"y_axis_gridlines\":true,\"show_view_names\":false,\"show_y_axis_labels\":true,\"show_y_axis_ticks\":true,\"y_axis_tick_density\":\"default\",\"y_axis_tick_density_custom\":5,\"show_x_axis_label\":true,\"show_x_axis_ticks\":true,\"y_axis_scale_mode\":\"linear\",\"x_axis_reversed\":false,\"y_axis_reversed\":false,\"plot_size_by_field\":false,\"trellis\":\"\",\"stacking\":\"\",\"limit_displayed_rows\":false,\"legend_position\":\"center\",\"point_style\":\"none\",\"show_value_labels\":false,\"label_density\":25,\"x_axis_scale\":\"auto\",\"y_axis_combined\":true,\"ordering\":\"none\",\"show_null_labels\":false,\"show_totals_labels\":false,\"show_silhouette\":false,\"totals_color\":\"#808080\",\"color_application\":{\"collection_id\":\"d754397b-2c05-4470-bbbb-05eb4c2b15cd\",\"palette_id\":\"b0768e0d-03b8-4c12-9e30-9ada6affc357\",\"options\":{\"steps\":5}},\"type\":\"looker_column\",\"defaults_version\":1}' %}{{ responses_by_answer._link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=10&column_limit=100&pivots=products.department&f[users.gender]=-NULL&f[products.department]=-NULL&sorts=products.total_retail_price desc 0"
      #url: "{{ responses_by_answer._link }}&pivots=products.department&f[users.gender]=-NULL&f[products.department]=-NULL&sorts=products.total_retail_price+desc+0,products.department&limit=10&column_limit=10&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22d754397b-2c05-4470-bbbb-05eb4c2b15cd%22%2C%22palette_id%22%3A%22b0768e0d-03b8-4c12-9e30-9ada6affc357%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22users.gender%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22products.department%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&toggle=vis"
      url: "{{ responses_by_answer._link }}&pivots=products.department&f[users.gender]=-NULL&f[products.department]=-NULL&sorts=products.total_retail_price+desc+0,products.department&limit=10&column_limit=10&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D%26filter_config%3D%7B%22users.gender%22%3A%5B%7B%22type%22%3A%22!null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22products.department%22%3A%5B%7B%22type%22%3A%22!null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&toggle=vis"

    }
  }

  measure: answer_details_encode{
    type: string
    sql: "Answer Details Encode and JSON Parse Scape URL" ;;
    link:{
      label: "View details by Question ENCODE URL and JSON Scape URL"
      #url: "{{ responses_by_answer._link }}&pivots=products.department&sorts=products.total_retail_price+desc+0,products.department&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22d754397b-2c05-4470-bbbb-05eb4c2b15cd%22%2C%22palette_id%22%3A%22b0768e0d-03b8-4c12-9e30-9ada6affc357%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22users.gender%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22products.department%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&limit=10&column_limit=10"
      url: "{% assign vis_config =
      '{\"x_axis_gridlines\":false,
      \"y_axis_gridlines\":true,
      \"show_view_names\":false,
      \"show_y_axis_labels\":true,
      \"show_y_axis_ticks\":true,
      \"y_axis_tick_density\":\"default\",
      \"y_axis_tick_density_custom\":5,
      \"show_x_axis_label\":true,
      \"show_x_axis_ticks\":true,
      \"y_axis_scale_mode\":\"linear\",
      \"x_axis_reversed\":false,
      \"y_axis_reversed\":false,
      \"plot_size_by_field\":false,
      \"trellis\":\"\",
      \"stacking\":\"\",
      \"limit_displayed_rows\":false,
      \"legend_position\":\"center\",
      \"point_style\":\"none\",
      \"show_value_labels\":false,
      \"label_density\":25,
      \"x_axis_scale\":\"auto\",
      \"y_axis_combined\":true,
      \"ordering\":\"none\",
      \"show_null_labels\":false,
      \"show_totals_labels\":false,
      \"show_silhouette\":false,
      \"totals_color\":\"#808080\",
      \"color_application\":{
      \"options\":{\"steps\":5}},\"type\":\"looker_column\",
      \"defaults_version\":1
      }' %}{{ responses_by_answer._link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=10&column_limit=100&pivots=products.department&f[users.gender]=-NULL&f[products.department]=-NULL&sorts=products.total_retail_price desc 0"
      #ENCODE url: "{{ responses_by_answer._link }}&pivots=products.department&f[users.gender]=-NULL&f[products.department]=-NULL&sorts=products.total_retail_price+desc+0,products.department&limit=10&column_limit=10&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22d754397b-2c05-4470-bbbb-05eb4c2b15cd%22%2C%22palette_id%22%3A%22b0768e0d-03b8-4c12-9e30-9ada6affc357%22%2C%22options%22%3A%7B%22steps%22%3A5%7D%7D%2C%22type%22%3A%22looker_column%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22users.gender%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22products.department%22%3A%5B%7B%22type%22%3A%22%21null%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&toggle=vis"

    }
  }
  measure: responses_by_answer {
    hidden: yes
    type: count_distinct
    sql: 0 ;;
    drill_fields: [products.total_retail_price,products.department,users.state]
  }


  dimension: brand_logo_2 {
    type: string
    sql: ${TABLE}.gender ;;
    html:
      {% if rendered_value == "f" %}
      <img src="http://drive.google.com/uc?export=view&id=1iqWaQiLgvF1lUaE9ErhT6PhLa6uiUIdl" height="180" width="256" />
      {% elsif rendered_value == "m" %}
      <img src="http://drive.google.com/uc?export=view&id=1mwl8_595G8nXwymgQX3mxEv8VkcY2c3f" height="180" width="256" />

      {% elsif rendered_value == "" %}
      <img src="http://drive.google.com/uc?export=view&id=12BwdwalexyiQjl3gC_lzE3yqfSI1BEpS" height="180" width="256"/>
      {% else %}
      <img src="http://drive.google.com/uc?export=view&id=1UmTW3Sycq3LeBUnEcVajYHdneBnZljYh" height="180" width="256"/>
      {% endif %} ;;
  }

}
