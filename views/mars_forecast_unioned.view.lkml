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
  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
    value_format_name: usd_0
  }
  measure: sum_value {
    label: "Dollars"
    type: sum
    sql: ${value};;
    value_format: "0.0,,\"M\""
  }
  measure: 2024_gsv {
    type: sum
    sql: ${value} ;;
    filters: [source: "2024_actual"]
    value_format_name: usd_0
  }
  measure: 2025_gsv {
    type: sum
    sql: ${value} ;;
    filters: [source: "2025_ytd_202507_and_forecast"]
    value_format: "0.0,,\"M\""
  }
  measure: 2025_planned_gsv {
    type: sum
    sql: ${value} ;;
    filters: [source: "2025_plan"]
    value_format: "0.0,,\"M\""
  }


  measure: 2025_actuals_vs_plan_difference_numeric{
    type: number
    sql: ${2025_gsv} - ${2025_planned_gsv} ;;
    value_format: "0.0,,\"M\""
  }
  measure: 2025_actuals_vs_plan_difference_percentage {
    type: number
    sql: safe_divide((${2025_gsv} - ${2025_planned_gsv}),${2025_planned_gsv}) ;;
    value_format_name: percent_0
  }

  measure: yoy_growth_plan_percentage {
    type: number
    sql: safe_divide((${2025_planned_gsv} - ${2024_gsv}),${2024_gsv}) ;;
    value_format_name: percent_1
  }
  measure: yoy_growth_plan_numeric {
    type: number
    sql: ${2025_planned_gsv} - ${2024_gsv} ;;
    value_format: "0.0,,\"M\""
  }




  # measure: 2025_2024_difference_numeric {
  #   type: number
  #   sql: ${2025_gsv} - ${2024_gsv} ;;
  #   value_format: "0.0,,\"M\""
  # }
  # measure: 2025_2024_difference_percentage {
  #   type: number
  #   sql: safe_divide((${2025_gsv} - ${2024_gsv}),${2024_gsv}) ;;
  #   value_format_name: percent_0
  # }
  dimension: yyyymm {
    label: "Accounting Period"
    type: string
    sql: ${TABLE}.yyyymm ;;
  }
  measure: count {
    type: count
  }
  dimension: year_cleaned {
    type: string
    sql: left(${yyyymm}, 4) ;;
  }
  dimension: quarter {
    case: {
      when: {
        label: "Q1"
        sql: right(${yyyymm},2) = '01' or right(${yyyymm},2) = '02' or right(${yyyymm},2) = '03'  ;;
      }
      when: {
        label: "Q2"
        sql: right(${yyyymm},2) = '04' or right(${yyyymm},2) = '05' or right(${yyyymm},2) = '06'  ;;
      }
      when: {
        label: "Q3"
        sql: right(${yyyymm},2) = '07' or right(${yyyymm},2) = '08' or right(${yyyymm},2) = '09'  ;;
      }
      when: {
        label: "Q4"
        sql: right(${yyyymm},2) = '10' or right(${yyyymm},2) = '11' or right(${yyyymm},2) = '12' or right(${yyyymm},2) = '13' ;;
      }
    }
  }
  dimension: year_quarter {
    type: string
    sql: concat(${year_cleaned}, " ", ${quarter}) ;;
  }

}
