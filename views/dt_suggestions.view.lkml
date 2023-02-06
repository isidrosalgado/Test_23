view: dt_suggestions {
  derived_table: {
    sql: SELECT
          DISTINCT(users.state)  AS state,
          users.country  AS country
      FROM demo_db.users  AS users

      group by users.city
      ORDER BY
      users.state
      ;;
  }

#filter: country_filter {type:string}
#filter: date_test {type: date}


  dimension: users_state {
    type: string
    sql: ${TABLE}.state ;;
    hidden: yes
  }

  dimension: users_country {
    type: string
    sql: ${TABLE}.country ;;
    hidden: yes
  }

  set: detail {
    fields: [users_state, users_country]
  }
}
