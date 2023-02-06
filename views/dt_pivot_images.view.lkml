view: dt_pivot_image_test {
  derived_table: {
    sql: SELECT
      'Test_1' AS name, 'https://cdn.shopify.com/s/files/1/0193/7641/products/fifty-nine-parks-print-series-rocky-mountain-national-park-poster-rory-kurtz-variant_1200x_2b0424dc-6e64-43ab-bc73-b042199305de_1200x630.jpg?v=1642691774' AS art_link, 1 as counter
      UNION ALL
      SELECT
      'Test_2' AS name,
      'https://cdn.shopify.com/s/files/1/0193/7641/products/fifty-nine-parks-print-series-rocky-mountain-national-park-poster-rory-kurtz-variant_1200x_2b0424dc-6e64-43ab-bc73-b042199305de_1200x630.jpg?v=1642691774' AS art_link, 1 as counter
      UNION ALL
      SELECT
      'Test_3' AS name,
      'https://70f186a60af817fe0731-09dac41207c435675bfd529a14211b5c.ssl.cf1.rackcdn.com/assets/attachments_p/000/064/575/original_fifty-nine-parks-print-series-capitol-reef-national-park-claire-hummel_1024x1024_copy.jpg' AS art_link, 1 as counter
      UNION ALL
      SELECT
      'Test_4' AS name,
      'https://70f186a60af817fe0731-09dac41207c435675bfd529a14211b5c.ssl.cf1.rackcdn.com/assets/attachments_p/000/064/575/original_fifty-nine-parks-print-series-capitol-reef-national-park-claire-hummel_1024x1024_copy.jpg' AS art_link, 1 as counter
      UNION ALL
      SELECT
      'Test_5' AS name,
      'https://70f186a60af817fe0731-09dac41207c435675bfd529a14211b5c.ssl.cf1.rackcdn.com/assets/attachments_p/000/064/575/original_fifty-nine-parks-print-series-capitol-reef-national-park-claire-hummel_1024x1024_copy.jpg' AS art_link, 1 as counter
      UNION ALL
      SELaECT
      'Test_6' AS name,
      'https://cdn.shopify.com/s/files/1/0019/1417/5542/products/fifty-nine-parks-print-series-crater-lake-national-park-night-sky-poster-by-dan-mccarthy_1200x_ce7c3e3f-fdad-4480-917c-2ac13167ec6e_930x.jpg?v=1593727108' AS art_link, 1 as counter
      UNION ALL
      SELECT
      'Test_7' AS name,
      'https://cdn.shopify.com/s/files/1/0019/1417/5542/products/fifty-nine-parks-print-series-crater-lake-national-park-night-sky-poster-by-dan-mccarthy_1200x_ce7c3e3f-fdad-4480-917c-2ac13167ec6e_930x.jpg?v=1593727108' AS art_link, 1 as counter
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    primary_key: yes
  }

  dimension: art_link {
    type: string
    sql: ${TABLE}.art_link ;;
  }

  dimension: art_image {
    type: string
    sql: ${TABLE}.art_link ;;
    html: <img height="450" src="{{ value }}" /> ;;
  }

  dimension: counter {
    type: number
    sql: ${TABLE}.counter ;;
  }

  measure: sum_counter {
    type: sum
    sql: ${TABLE}.counter ;;
  }
  set: detail {
    fields: [name, art_link, counter]
  }
}
