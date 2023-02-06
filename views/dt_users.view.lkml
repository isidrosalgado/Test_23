view: dt_users {
  derived_table: {
    sql: SELECT
          users.id  AS id,
          users.first_name  AS first_name,
          users.last_name  AS last_name,
          users.email  AS email,
          users.gender  AS gender,
          users.age  AS age,
          users.city  AS city,
          users.country  AS country,
          users.state AS state,
          users.zip  AS zip
      FROM demo_db.users
      ORDER BY
          id
       ;;
    #sql_trigger_value: SELECT CURDATE() ;;
    #interval_trigger: "5 minutes"
    #datagroup_trigger: test_dt_users_2
      persist_for: "3 minutes"
      indexes: ["id"]

    }



    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: users_id {
      primary_key: yes
      type: number
      sql: ${TABLE}.id ;;
    }

    dimension: users_first_name {
      type: string
      sql: ${TABLE}.first_name ;;
    }

    dimension: users_last_name {
      type: string
      sql: ${TABLE}.last_name ;;
    }

    dimension: users_email {
      type: string
      sql: ${TABLE}.email ;;
    }

    dimension: users_gender {
      type: string
      sql: ${TABLE}.gender ;;
    }

    dimension: users_age {
      type: number
      sql: ${TABLE}.age ;;
    }

    dimension: users_city {
      type: string
      sql: ${TABLE}.city ;;
    }

    dimension: users_country {
      type: string
      sql: ${TABLE}.country ;;
    }

    dimension: users_state {
      type: string
      sql: ${TABLE}.state ;;
    }

    dimension: users_zip {
      type: number
      sql: ${TABLE}.zip ;;
    }

    set: detail {
      fields: [
        users_id,
        users_first_name,
        users_last_name,
        users_email,
        users_gender,
        users_age,
        users_city,
        users_country,
        users_state,
        users_zip
      ]
    }
  }
