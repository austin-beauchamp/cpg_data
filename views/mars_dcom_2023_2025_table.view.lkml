view: mars_dcom_2023_2025_table {
  sql_table_name: `big-query-sales-demo.consumer_packaged_goods.mars_dcom_2023_2025_table` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: accounting_period {
    type: string
    sql: CONCAT(${TABLE}.year, '-', LPAD(CAST(${TABLE}.period AS STRING), 2, '0')) ;;

  }
  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }
  dimension: business_segment {
    type: string
    sql: ${TABLE}.Business_Segment ;;
  }
  dimension: channel {
    type: string
    sql: ${TABLE}.Channel ;;
  }
  dimension: market {
    type: string
    sql: ${TABLE}.Market ;;
  }
  dimension: currency_code {
    type: string
    sql: ${TABLE}.Currency_Code ;;
  }
  dimension: customer {
    type: string
    sql: ${TABLE}.Customer ;;
  }
  dimension: ean {
    type: number
    sql: ${TABLE}.Ean ;;
  }
  dimension: economic_cell_group {
    type: string
    sql: ${TABLE}.Economic_Cell_Group ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.Year ;;
  }
  dimension: period {
    type: number
    sql: ${TABLE}.Period ;;
  }
  dimension: zrep {
    type: number
    sql: ${TABLE}.Zrep ;;
  }
  dimension: product_code {
    type: string
    sql: ${TABLE}.Product_Code ;;
  }
  dimension: specific_size_attribute {
    type: string
    sql: ${TABLE}.Specific_Size_Attribute ;;
  }
  dimension: product_description {
    type: string
    sql: ${TABLE}.Product_Description ;;
  }
  dimension: product_id {
    type: string
    sql: ${TABLE}.Product_Id ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }
  dimension: gsv_dim {
    description: "GSV — Gross Sales Value at the manufacturer invoice price before trade discounts and deductions"
    type: number
    sql: ${TABLE}.Gsv ;;
    value_format_name: usd_0
  }
  measure: gsv {
    description: "GSV — Gross Sales Value at the manufacturer invoice price before trade discounts and deductions"
    type: sum
    sql: ${TABLE}.Gsv ;;
    value_format_name: usd
  }
  measure: gsv_click_and_mortar {
    hidden: no
    type: sum
    sql: ${gsv_dim} ;;
    filters: {
      field: channel
      value: "CLICK & MORTAR"

    }
    value_format_name: usd_0
  }

  measure: gsv_click_odd {
    hidden: no
    type: sum
    sql: ${gsv_dim} ;;
    filters: {
      field: channel
      value: "ON DEMAND DELIVERY"

    }
    value_format_name: usd_0
  }
  measure: gsv_click_pure_play {
    hidden: no
    type: sum
    sql: ${gsv_dim} ;;
    filters: {
      field: channel
      value: "PURE-PLAY"

    }
    value_format_name: usd_0
  }

  dimension: cogs_dim {
    description: "COGS — Cost of Goods Sold (manufacturing + freight-in and any standard product costs tied to the units sold)"
    type: number
    sql: ${TABLE}.Cogs ;;
    value_format_name: usd
  }

  measure: cogs {
    description: "COGS — Cost of Goods Sold (manufacturing + freight-in and any standard product costs tied to the units sold)"
    type: sum
    sql: ${TABLE}.Cogs ;;
    value_format_name: usd
  }
  measure: cogs_click_and_mortar {
    hidden: no
    type: sum
    sql: ${cogs_dim} ;;
    filters: {
      field: channel
      value: "CLICK & MORTAR"

    }
    value_format_name: usd_0
  }

  measure: cogs_click_odd {
    hidden: no
    type: sum
    sql: ${cogs_dim} ;;
    filters: {
      field: channel
      value: "ON DEMAND DELIVERY"

    }
    value_format_name: usd_0
  }
  measure: cogs_click_pure_play {
    hidden: no
    type: sum
    sql: ${cogs_dim} ;;
    filters: {
      field: channel
      value: "PURE-PLAY"

    }
    value_format_name: usd_0
  }

  dimension: mac_dim {
    description: "MAC — Margin After COGS (contribution margin at the NSV level)"
    type: number
    sql: ${TABLE}.Mac ;;
    value_format_name: usd
  }

  measure: mac_click_and_mortar {
    hidden: no
    type: sum
    sql: ${mac_dim} ;;
    filters: {
      field: channel
      value: "CLICK & MORTAR"

    }
    value_format_name: usd_0
  }

  measure: mac_click_odd {
    hidden: no
    type: sum
    sql: ${mac_dim} ;;
    filters: {
      field: channel
      value: "ON DEMAND DELIVERY"

    }
    value_format_name: usd_0
  }
  measure: mac_click_pure_play {
    hidden: no
    type: sum
    sql: ${mac_dim} ;;
    filters: {
      field: channel
      value: "PURE-PLAY"

    }
    value_format_name: usd_0
  }

  measure: mac {
    description: "MAC — Margin After COGS (contribution margin at the NSV level)"
    type: sum
    sql: ${TABLE}.Mac ;;
    value_format_name: usd
  }
  measure: nsv {
    description: "NSV — Net Sales Value after trade spend and deductions"
    type: sum
    sql: ${TABLE}.Nsv ;;
    value_format_name: usd
  }

  dimension: nsv_dim {
    description: "NSV — Net Sales Value after trade spend and deductions"
    type: number
    sql: ${TABLE}.Nsv ;;
    value_format_name: usd
  }

  measure: nsv_click_and_mortar {
    hidden: no
    type: sum
    sql: ${nsv_dim} ;;
    filters: {
      field: channel
      value: "CLICK & MORTAR"

    }
    value_format_name: usd_0
  }

  measure: nsv_click_odd {
    hidden: no
    type: sum
    sql: ${nsv_dim} ;;
    filters: {
      field: channel
      value: "ON DEMAND DELIVERY"

    }
    value_format_name: usd_0
  }
  measure: nsv_click_pure_play {
    hidden: no
    type: sum
    sql: ${nsv_dim} ;;
    filters: {
      field: channel
      value: "PURE-PLAY"

    }
    value_format_name: usd_0
  }
  measure: rsv {
    description: "RSV — Retail Sales Value (consumer spend at shelf)"
    type: sum
    sql: ${TABLE}.Rsv ;;
    value_format_name: usd
  }
  measure: rsv_units {
    description: "RSV Units — Retail sales volume in units (sell-out units at retail)"
    type: sum
    sql: ${TABLE}.Rsv_Units ;;
    value_format_name: decimal_0
  }
  measure: trade_expenditure {
    description: "Trade Expenditure — Total trade discounts/investment (off-invoice, billbacks, rebates, co-op, in-store promos, etc.)"
    type: sum
    sql: ${TABLE}.Trade_Expenditure ;;
    value_format_name: usd
  }
  dimension: trade_expenditure_dim {
    description: "Trade Expenditure — Total trade discounts/investment (off-invoice, billbacks, rebates, co-op, in-store promos, etc.)"
    type: number
    sql: ${TABLE}.Trade_Expenditure ;;
    value_format_name: usd
  }
  measure: trade_expenditure_click_and_mortar {
    hidden: no
    type: sum
    sql: ${trade_expenditure_dim} ;;
    filters: {
      field: channel
      value: "CLICK & MORTAR"

    }
    value_format_name: usd_0
  }

  measure: trade_expenditure_click_odd {
    hidden: no
    type: sum
    sql: ${trade_expenditure_dim} ;;
    filters: {
      field: channel
      value: "ON DEMAND DELIVERY"

    }
    value_format_name: usd_0
  }
  measure:trade_expenditure_click_pure_play {
    hidden: no
    type: sum
    sql: ${trade_expenditure_dim} ;;
    filters: {
      field: channel
      value: "PURE-PLAY"

    }
    value_format_name: usd_0
  }
  measure: count {
    type: count
    drill_fields: [id]
  }



  ### 2024 vs. 2025 fields
  measure: gsv_2025 {
    group_label: "Slide 5"
    type: sum
    sql: ${gsv_dim} ;;
    filters: [year: "2025"]
    value_format: "$0.0,,\"\""
  }
  measure: gsv_2024 {
    group_label: "Slide 5"
    type: sum
    sql: ${gsv_dim} ;;
    filters: [year: "2024"]
    value_format: "$0.0,,\"\""
  }
  measure: gsv_variance {
    group_label: "Slide 5"
    type: number
    sql: (${gsv_2025}-${gsv_2024}) ;;
    value_format: "$0.0,,\"\""
  }
  measure: gsv_yoy_percentage {
    group_label: "Slide 5"
    type: number
    sql: safe_divide((${gsv_2025}-${gsv_2024}),${gsv_2024}) ;;
    value_format_name: percent_1
  }

  measure: nsv_2025 {
    group_label: "Slide 5"
    type: sum
    sql: ${nsv_dim} ;;
    filters: [year: "2025"]
    value_format: "$0.0,,\"\""
  }
  measure: nsv_2024 {
    group_label: "Slide 5"
    type: sum
    sql: ${nsv_dim} ;;
    filters: [year: "2024"]
    value_format: "$0.0,,\"\""
  }
  measure: nsv_variance {
    group_label: "Slide 5"
    type: number
    sql: (${nsv_2025}-${nsv_2024}) ;;
    value_format: "$0.0,,\"\""
  }
  measure: nsv_yoy_percentage {
    group_label: "Slide 5"
    type: number
    sql: safe_divide((${nsv_2025}-${nsv_2024}),${nsv_2024}) ;;
    value_format_name: percent_1
  }

  measure: cogs_2025 {
    group_label: "Slide 5"
    type: sum
    sql: ${cogs_dim} ;;
    filters: [year: "2025"]
    value_format: "$0.0,,\"\""
  }
  measure: cogs_2024 {
    group_label: "Slide 5"
    type: sum
    sql: ${cogs_dim} ;;
    filters: [year: "2024"]
    value_format: "$0.0,,\"\""
  }
  measure: cogs_variance {
    group_label: "Slide 5"
    type: number
    sql: (${cogs_2025}-${cogs_2024}) ;;
    value_format: "$0.0,,\"\""
  }

  measure: mac_2025 {
    group_label: "Slide 5"
    type: sum
    sql: ${mac_dim} ;;
    filters: [year: "2025"]
    value_format: "$0.0,,\"\""
  }
  measure: mac_2024 {
    group_label: "Slide 5"
    type: sum
    sql: ${mac_dim} ;;
    filters: [year: "2024"]
    value_format: "$0.0,,\"\""
  }
  measure: mac_variance {
    group_label: "Slide 5"
    type: number
    sql: (${mac_2025}-${mac_2024}) ;;
    value_format: "$0.0,,\"\""
  }
  measure: mac_percentage_2025 {
    group_label: "Slide 5"
    type: number
    sql: safe_divide(${mac_2025},${nsv_2025}) ;;
    value_format_name: percent_1
  }
  measure: mac_percentage_2024 {
    group_label: "Slide 5"
    type: number
    sql: safe_divide(${mac_2024},${nsv_2024}) ;;
    value_format_name: percent_1
  }
  measure: mac_percentage_variance {
    group_label: "Slide 5"
    type: number
    sql: (${mac_percentage_2025}-${mac_percentage_2024}) ;;
    value_format_name: percent_1
  }


  measure: trade_expenditure_2025 {
    group_label: "Slide 5"
    type: sum
    sql: ${trade_expenditure_dim} ;;
    filters: [year: "2025"]
    value_format: "$0.0,,\"\""
  }
  measure: trade_expenditure_2024 {
    group_label: "Slide 5"
    type: sum
    sql: ${trade_expenditure_dim} ;;
    filters: [year: "2024"]
    value_format: "$0.0,,\"\""
  }
  measure: trade_expenditure_variance {
    group_label: "Slide 5"
    type: number
    sql: (${trade_expenditure_2025}-${trade_expenditure_2024}) ;;
    value_format: "$0.0,,\"\""
  }
  measure: te_gsv_percentage_2025 {
    group_label: "Slide 5"
    type: number
    sql: safe_divide(${trade_expenditure_2025},${gsv_2025}) ;;
    value_format_name: percent_1
  }
  measure: te_gsv_percentage_2024 {
    group_label: "Slide 5"
    type: number
    sql: safe_divide(${trade_expenditure_2024},${gsv_2024}) ;;
    value_format_name: percent_1
  }
  measure: te_gsv_percentage_variance {
    group_label: "Slide 5"
    type: number
    sql: (${te_gsv_percentage_2025}-${te_gsv_percentage_2024}) ;;
    value_format_name: percent_1
  }
}
