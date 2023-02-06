view: chi_square_example_dt {

  derived_table: {

    sql:

    select 'aa00' as experimentId, 0 as variant, 188900 as observed, 188614 as expected
    union all
    select 'aa00' as experimentId, 1 as variant, 187971 as observed, 188614 as expected
    union all
    select 'aa00' as experimentId, 2 as variant, 188971 as observed, 188614 as expected
    union all
    select 'aa01' as experimentId, 0 as variant, 177650 as observed, 176925 as expected
    union all
    select 'aa01' as experimentId, 1 as variant, 176200 as observed, 176925 as expected


      ;;

  }


  dimension: experimentId {

    type: string

    sql: ${TABLE}.experimentId ;;

  }


  dimension: variant {

    type: string

    sql: ${TABLE}.variant ;;

  }


  measure: observed_measure {

    type: sum

    sql: COALESCE(${TABLE}.observed,0) ;;

  }


  measure: expected_measure {

    type: sum

    sql: COALESCE(${TABLE}.expected,0) ;;

  }

}
