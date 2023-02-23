connection: "thelook"
#test
# include all the views
include: "/views/**/*.view"


datagroup: test_isidro_default_datagroup{
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}


persist_with: test_isidro_default_datagroup

#<<<<<<< HEAD


# Repro ticket 544848 Explore
explore: dt_orders_order_items {
  join: inventory_items {
    type: left_outer
    sql_on: ${dt_orders_order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  aggregate_table: by_date {
    query: {
      dimensions: [created_date, order_id, returned_date]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      persist_for: "90 minutes"
    }
  }

  aggregate_table: by_month {
    query: {
      dimensions: [created_month, order_id, returned_month]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      persist_for: "90 minutes"
    }
  }

  aggregate_table: by_year {
    query: {
      dimensions: [created_year, inventory_items.id, order_id, returned_year]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      persist_for: "90 minutes"
    }
  }
}

explore: dt_orders{}
#=======
#explore: dt_orders{}
#>>>>>>> branch 'master' of git@github.com:hijuancarlos/gcpm2210_thelook-.git

explore: imgsrc1onerroralert2 {}

explore: test_j {}

explore: account {}

explore: billion_orders {
  join: orders {
    type: left_outer
    sql_on: ${billion_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }


  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: connection_reg_r3 {}

explore: dept {}

explore: employees {}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: fakeorders {
  join: orders {
    type: left_outer
    sql_on: ${fakeorders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: flights {}

explore: human {}

explore: hundred_million_orders {
  join: orders {
    type: left_outer
    sql_on: ${hundred_million_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: hundred_million_orders_wide {
  join: orders {
    type: left_outer
    sql_on: ${hundred_million_orders_wide.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: incremental_pdts_test {}

explore: ints {}

explore: inventory_items {
  #fields: [ALL_FIELDS*, -inventory_items.test_using_a_measure, -inventory_items.avg_test, -products.total_test]
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
#<<<<<<< HEAD
  join: order_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }
#=======
#>>>>>>> branch 'master' of git@github.com:hijuancarlos/gcpm2210_thelook-.git
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }


}

explore: order_items_test {
  view_name: order_items
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }
}



explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

}

explore: pegdates {}

explore: person {}

explore: persons {}

explore: persons2 {}

explore: products {
  fields: [ALL_FIELDS*, -products.total_test]
}

explore: salary {
  join: dept {
    type: left_outer
    sql_on: ${salary.dept_id} = ${dept.dept_id} ;;
    relationship: many_to_one
  }
}



explore: schema_migrations {}



explore: ten_million_orders {
  join: orders {
    type: left_outer
    sql_on: ${ten_million_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: test {}

explore: users {
  sql_always_where: ${test_city} <> 'Abbeville' ;;
}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users_test {
  from: users
  join: dt_suggestions {
    sql_on: ${users_test.country} = ${dt_suggestions.users_country} ;;
    relationship: one_to_one
  }
}

explore: dt_suggestions {
  hidden: yes
}

explore: chi_square_example_dt {}

#=======
explore: dt_timeline_test {}
#>>>>>>> branch 'master' of git@github.com:hijuancarlos/gcpm2210_thelook-.git

explore: dt_pivot_image_test {}

datagroup: test_dt_users {
  sql_trigger: SELECT EXTRACT(MINUTE FROM CURRENT_TIMESTAMP()) ;;
  #interval_trigger: "5 minutes"
}


datagroup: test_dt_users_2 {
  #sql_trigger: SELECT EXTRACT(MINUTE FROM CURRENT_TIMESTAMP()) ;;
  #interval_trigger: "5 minutes"
  max_cache_age: "3 minutes"
}

explore: dt_users {}


explore: ndt_users {}

explore: order {}
