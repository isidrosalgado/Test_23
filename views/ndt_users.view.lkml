view: ndt_users {# If necessary, uncomment the line below to include explore_source.
# include: "thelook_carlos.model.lkml"
  derived_table: {
    explore_source: dt_users {
      column: users_city {}
      column: users_country {}
      column: users_state {}
      column: count {}
    }
  }
  dimension: users_city {
    description: ""
  }
  dimension: users_country {
    description: ""
  }
  dimension: users_state {
    description: ""
  }
  dimension: count {
    description: ""
    type: number
  }
}
