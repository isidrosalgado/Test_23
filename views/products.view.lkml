view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: total_retail_price {
    type: sum
    sql: ${retail_price} ;;
  }


  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }

  measure: total_test {
    type: count_distinct
    sql:  ${id} ;;
    filters: {
      field: order_items.order_id
      value: "50"
    }
  }

  ###
  measure: lowest_price {
    type: min
    sql: ${TABLE}.retail_price ;;
    value_format_name: usd_0
  }

  dimension: brand_logo_2 {
    type: string
    sql:
    case when (${TABLE}.department is not null) then ${TABLE}.department else "" end;;
    html:
      {% if rendered_value == "Men" %}
      <img src="http://drive.google.com/uc?export=view&id=1iqWaQiLgvF1lUaE9ErhT6PhLa6uiUIdl" height="180" width="256" />
      {% elsif rendered_value == "Woman" %}
      <img src="http://drive.google.com/uc?export=view&id=1mwl8_595G8nXwymgQX3mxEv8VkcY2c3f" height="180" width="256" />
      {% elsif rendered_value == "" %}
      <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png" height="180" width="256"/>
      {% else %}
      <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png" height="180" width="256"/>
      {% endif %} ;;
  }
}
