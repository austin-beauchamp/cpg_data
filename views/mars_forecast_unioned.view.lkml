view: mars_forecast_unioned {
  sql_table_name: `big-query-sales-demo.consumer_packaged_goods.mars_forecast_unioned` ;;

  dimension: accounts {
    type: string
    sql: ${TABLE}.Accounts ;;
  }
  dimension: dcom_scorecard {
    type: string
    sql: ${TABLE}.Dcom_scorecard ;;
  }
  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }
  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }
  measure: value {
    label: "dollars"
    type: sum
    sql: ${TABLE}.value ;;
    value_format_name: usd_0
  }
  dimension: yyyymm {
    type: string
    sql: ${TABLE}.yyyymm ;;
  }
  measure: count {
    type: count
  }
}
