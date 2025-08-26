view: mars_forecast_unioned {
  sql_table_name: `big-query-sales-demo.consumer_packaged_goods.mars_forecast_unioned` ;;

  dimension: accounts {
    label: "Account Name"
    description: "The name of the account"
    type: string
    sql: ${TABLE}.Accounts ;;
  }
  dimension: dcom_scorecard {
    label: "DCOM"
    description: "The type of account."
    type: string
    sql: ${TABLE}.Dcom_scorecard ;;
  }
  dimension: period {
    hidden: yes
    type: string
    sql: ${TABLE}.period ;;
  }
  dimension: source {
    hidden: yes
    type: string
    sql: ${TABLE}.source ;;
  }
  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
    # value_format_name: usd_0
  }
  measure: sum_value {
    hidden: yes
    label: "Dollars"
    type: sum
    sql: ${value};;
    # value_format_name: usd_0
    value_format: "$0.0,,\"M\""
  }
  measure: 2024_gsv {
    group_label: "GSV"
    label: "Total GSV (2024)"
   description: "2024's Gross Sales Value. Represents the total value of all sales of a company's products or services before any deductions are made"
    type: sum
    sql: ${value} ;;
    filters: [source: "2024_actual"]
    # value_format_name: usd_0
    value_format: "$0.0,,\"M\""
  }
  measure: 2025_gsv {
    group_label: "GSV"
    label: "Total GSV (2025)"
    description: "2025's Gross Sales Value. Represents the total value of all sales of a company's products or services before any deductions are made"
    type: sum
    sql: ${value} ;;
    filters: [source: "2025_ytd_202507_and_forecast"]
    # value_format_name: usd_0
    value_format: "$0.0,,\"M\""
  }
  measure: 2025_planned_gsv {
    group_label: "GSV"
    label: "Total Planned GSV (2025)"
    description: "2025's Planned Gross Sales Value. Represents the forecasted total value of all sales of a company's products or services before any deductions are made"
    type: sum
    sql: ${value} ;;
    filters: [source: "2025_plan"]
    # value_format_name: usd_0
    value_format: "$0.0,,\"M\""
  }


  measure: 2025_actuals_vs_plan_difference_numeric{
    group_label: "GSV"
    label: "Variance to Plan (2025)"
    description: "The difference between 2025 actual data and 2025 planned data."
    type: number
    sql: ${2025_gsv} - ${2025_planned_gsv} ;;
    # value_format_name: usd_0
    value_format: "$0.0,,\"M\""
    drill_fields: [year_quarter, 2025_gsv, 2025_planned_gsv,2025_actuals_vs_plan_difference_numeric,2025_actuals_vs_plan_difference_percentage]
  }
  measure: 2025_actuals_vs_plan_difference_percentage {
    group_label: "GSV"
    label: "Variance to Plan Percentage (2025)"
    description: "The difference between 2025 actual data and 2025 planned data as a percentage."
    type: number
    sql: safe_divide((${2025_gsv} - ${2025_planned_gsv}),${2025_planned_gsv}) ;;
    value_format_name: percent_0
    drill_fields: [year_quarter, 2025_gsv, 2025_planned_gsv,2025_actuals_vs_plan_difference_numeric,2025_actuals_vs_plan_difference_percentage]
  }

  measure: yoy_growth_plan_percentage {
    group_label: "GSV"
    label: "YoY Growth Plan Percentage"
    description: "The difference between 2025 forecast data and 2024 actual data as a percentage."
    type: number
    sql: safe_divide(${yoy_growth_plan_numeric},${2024_gsv}) ;;
    value_format_name: percent_1
  }
  measure: yoy_growth_plan_numeric {
    group_label: "GSV"
    label: "YoY Growth Plan"
    description: "The difference between 2025 forecast data and 2024 actual data as a percentage."
    type: number
    sql: ${2025_planned_gsv} - ${2024_gsv} ;;
    # value_format_name: usd_0
    value_format: "$0.0,,\"M\""
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
    hidden: yes
    label: "Accounting Period"
    type: string
    sql: ${TABLE}.yyyymm ;;
  }
  dimension: period_cleaned {
    group_label: "Timeframes"
    label: "Period"
    description: "The period the GSV was accumalated. There are 13 periods (1-13)"
    type: string
    sql: right(${yyyymm}, 2) ;;
  }
  measure: count {
    type: count
    hidden: yes
  }
  dimension: year_cleaned {
    group_label: "Timeframes"
    label: "Year"
    description: "The year the GSV was accumalated."
    type: string
    sql: left(${yyyymm}, 4) ;;
    drill_fields: [quarter,period,accounts]
  }
  dimension: quarter {
    group_label: "Timeframes"
    label: "Quarter"
    description: "The quarter the GSV was accumalated."
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
    drill_fields: [period]
  }
  dimension: year_quarter {
    group_label: "Timeframes"
    label: "Year-Quarter"
    description: "The quarter and year the GSV was accumalated. A more detailed look at quarter."
    type: string
    sql: concat(${year_cleaned}, " ", ${quarter}) ;;
    drill_fields: [period]
  }

}
