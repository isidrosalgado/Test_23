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


explore: lookml_dashboard_repro{}

explore: dt_orders{}
#=======
#explore: dt_orders{}
#>>>>>>> branch 'master' of git@github.com:hijuancarlos/gcpm2210_thelook-.git

explore: imgsrc1onerroralert2 {}

explore: test_j {}

explore: account {}




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



explore: flights {}

explore: human {}




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

explore: orders {}

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
