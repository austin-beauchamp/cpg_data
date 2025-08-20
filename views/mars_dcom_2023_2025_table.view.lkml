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
  measure: gsv {
    label: "GSV — Gross Sales Value at the manufacturer invoice price before trade discounts and deductions"
    type: sum
    sql: ${TABLE}.Gsv ;;
    value_format_name: usd

  }
  measure: cogs {
    description: "COGS — Cost of Goods Sold (manufacturing + freight-in and any standard product costs tied to the units sold)"
    type: sum
    sql: ${TABLE}.Cogs ;;
    value_format_name: usd
  }
  measure: mac {
    description: "MAC — Margin After COGS (contribution margin at the NSV level)"
    type: sum
    sql: ${TABLE}.Mac ;;
    value_format_name: usd
  }
  measure: nsv {
    label: "NSV — Net Sales Value after trade spend and deductions"
    type: sum
    sql: ${TABLE}.Nsv ;;
    value_format_name: usd
  }
  measure: rsv {
    description: "RSV — Retail Sales Value (consumer spend at shelf)"
    type: sum
    sql: ${TABLE}.Rsv ;;
    value_format_name: usd
  }
  measure: rsv_units {
    label: "RSV Units — Retail sales volume in units (sell-out units at retail)"
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
  measure: count {
    type: count
    drill_fields: [id]
  }
}
