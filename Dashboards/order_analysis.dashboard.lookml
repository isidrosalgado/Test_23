- dashboard: order_analysis
  title: order_analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:

  elements:
  - name: Salaries
    title: Untitled Visualization
    model: test_isidro
    explore: salary
    type: looker_grid
    fields: [dept.dept_name, salary.salary, salary.average_salary]
    sorts: [salary.average_salary desc 0]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
